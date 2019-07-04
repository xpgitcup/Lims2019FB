package cn.edu.cup.init

import cn.edu.cup.basic.Caption
import cn.edu.cup.basic.PersonTitle
import cn.edu.cup.lims.Plan
import cn.edu.cup.lims.ThingType
import cn.edu.cup.system.DataRootPath
import cn.edu.cup.system.QueryStatementA
import cn.edu.cup.system.SystemAttribute
import cn.edu.cup.system.SystemMenu
import cn.edu.cup.system.SystemUser
import com.alibaba.fastjson.JSON
import grails.gorm.transactions.Transactional

import javax.servlet.ServletContext

@Transactional
class InitService {
    def grailsApplication
    def dataSource
    def systemMenuService
    def systemUserService
    def captionService
    def commonService
    def personTitleService
    def teacherService
    def systemCommonService
    def systemAttributeService
    def thingTypeService
    def planService
    def dataRootPathService
    def commonLimsService
    def queryStatementAService

    /**
     * 初始化代码__开发环境下的初始化代码
     */
    def configureForDevelopment(ServletContext servletContext) {
        println "这是开发环境..."
        println(grailsApplication.metadata.getApplicationName())
        processConfigFile(servletContext)
        checkSystemStatus()
    }

    def checkSystemStatus() {
        def domains = []
        grailsApplication.controllerClasses.each { e ->
            domains.add(e.name)
        }
        println("域类：${domains}")
        def controllers = [:]
        SystemMenu.list().each { e ->
            def item = [:]
            if (e.menuAction != "#") {
                def ee = e.menuAction.split("/")
                def ename = ee[0]
                def firstChar = ename.charAt(0).toUpperCase()
                def cname = "${firstChar}${ename.substring(1)}"
                //println(cname)
                def ok = domains.findIndexOf { it == cname }
                //println("${cname} ${ok}")
                controllers.put(cname, (ok > -1))
            }
        }
        println("系统状态 ${controllers}")
        return controllers
    }

    /*
    * 处理ocnfig.json文件
    * */

    private void processConfigFile(ServletContext servletContext) {
        // 获取Web的根目录
        def webRootDir = servletContext.getRealPath("/")

        // 先处理数据库脚本文件
        def configFileName = "${webRootDir}/config/scriptList.json"
        def scriptList = [:]
        scriptList = commonService.importObjectFromJsonFileName(configFileName, scriptList.getClass())
        println("处理脚本：${scriptList}")
        scriptList.each { e ->
            switch (e.key) {
                case "dir":
                    e.value.each { ee ->
                        loadScripts("${webRootDir}/${ee}")
                    }
                    break
                case "file":
                    def sfile = new File("${webRootDir}/${e.value}")
                    executeScript(sfile)
                    break
            }
        }

        // 处理应用程序名称、图标等信息
        def captionsFileName = "${webRootDir}/config/captions.json"
        if (captionService.count() < 1) {
            importObjects(captionsFileName, Caption.class, null)
        }

        // 处理菜单的设置
        def systemMenuFileName = "${webRootDir}/config/systemMenu.json"
        if (systemMenuService.count() < 1) {
            println("处理菜单...")
            importObjects(systemMenuFileName, SystemMenu.class, "selfCheck")
        }

        // 处理事情分类
        def thingTypeFileName = "${webRootDir}/config/thingType.json"
        if (thingTypeService.count() < 1) {
            importObjects(thingTypeFileName, ThingType.class, "selfCheck")
        }

        // 处理人员身份
        def personTitleFileName = "${webRootDir}/config/personTitle.json"
        if (personTitleService.count() < 1) {
            importObjects(personTitleFileName, PersonTitle.class, "selfCheck")
        }

        // 处理系统属性
        def attributeFileName = "${webRootDir}/config/systemAttribute.json"
        if (systemAttributeService.count() < 1) {
            importObjects(attributeFileName, SystemAttribute.class, "selfCheck")
        }

        // 处理数据路径
        def dataRootPathFileName = "${webRootDir}/config/dataRootPath.json"
        if (dataRootPathService.count() < 1) {
            def dataRootPaths = importObjects(dataRootPathFileName, DataRootPath.class, null)
            dataRootPaths.each { e ->
                dataRootPathService.save(e)
            }
        }

        // 处理SQL数据
        def queryStatementAFileName = "${webRootDir}/config/queryStatementa.json"
        if ((queryStatementAService.count() < 1) && (new File(queryStatementAFileName).exists())) {
            def queryStatementAs = importObjects(queryStatementAFileName, QueryStatementA.class, null)
            queryStatementAs.each { e ->
                queryStatementAService.save(e)
            }
        }

        // 初始化项目类型的计划
        if (planService.count() < 1) {
            initThingTypePlan()
        }

        // 初始化团队的计划
        commonLimsService.checkAndInitTeamProjectPlans()

    }

    private synchronized importObjects(GString captionsFileName, Class clazz, selfCheckMethod) {
        def objects = commonService.importObjectArrayFromJsonFileName(captionsFileName, clazz)
        objects.each { e ->
            if (selfCheckMethod) {
                e.metaClass.invokeMethod(e, selfCheckMethod)
            }
            //captionService.save(e)
            e.save(flush: true)
        }
        return objects
    }

    def initThingTypePlan() {
        def fileName = "${commonService.webRootPath}/config/thingTypePlan.json"
        def jsonFile = new File(fileName)
        def plans
        if (jsonFile.exists()) {
            def json = jsonFile.text
            plans = com.alibaba.fastjson.JSON.parse(json)

            println("计划配置：${plans}")
            plans.each { e ->
                def tp = ThingType.findByName(e.key)
                if (tp) {
                    println("创建 ${e.key} 计划...")
                    if (Plan.countByThingTypeAndUpPlanIsNull(tp) < 1) {
                        createPlan4ThingType(tp, e)
                        if (tp.subTypes) {
                            tp.subTypes.each { etp ->
                                createPlan4ThingType(etp, e)
                            }
                        }
                    }
                }
            }
        }
    }

    private void createPlan4ThingType(thingType, e) {
        // 创建根节点
        def p = new Plan(
                thingType: thingType,
                description: "${thingType.name}.计划",
                serialNumber: 0,
                updateDate: new Date()
        )
        planService.save(p)
        // 创建叶节点
        println("${e.value}")
        e.value.each { ee ->
            def sp = new Plan(
                    upPlan: p,
                    thingType: thingType,
                    description: ee.name,
                    serialNumber: ee.sn,
                    updateDate: new Date()
            )
            planService.save(sp)
        }
    }

    /**
     * 发布后的初始化代码
     */
    def configureForProduction(ServletContext servletContext) {
        println "这是发布环境..."
        //processConfigFile(servletContext)
    }

    /*
    * 加载数据库初始化脚本
    * */

    def loadScripts(String dir) {
        File sf = new File(dir)
        if (sf.exists()) {
            println "load scripts ${dir}"
            if (sf.isDirectory()) {
                sf.eachFile { f ->
                    if (f.isFile()) {
                        executeScript(f)
                    }
                }
            } else {
                println("执行${sf}...")
                executeScript(sf)
            }
        }
    }

    /**
     * 执行附加脚本
     * */

    def executeScript(File sf) {
        //def File sf = new File(fileName)
        println "init - ${sf}"
        if (sf) {
            def db
            def sql = sf.text
            db = new groovy.sql.Sql(dataSource)
            //println "init - ${theSQL}"
            def lines = sql.split(";")
            lines.each() { it ->
                //println "line: ${it}"
                it = it.trim()
                if (!it.isEmpty()) {
                    db.executeUpdate(it)
                }
            }
        }
    }

}
