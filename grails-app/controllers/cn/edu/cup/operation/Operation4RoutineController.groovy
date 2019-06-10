package cn.edu.cup.operation


import cn.edu.cup.lims.Progress
import cn.edu.cup.lims.ProgressController
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.ThingType
import cn.edu.cup.system.DataRootPath
import grails.util.Environment
import grails.validation.ValidationException
import groovy.sql.Sql

import java.text.SimpleDateFormat

class Operation4RoutineController extends ProgressController {

    def dataSource
    def commonService

    Boolean checkSupportFile(Progress progress) {
        if (progress.supportFileName.isEmpty()) {
            return true
        } else {
            def fileName = getRealFilePath(progress) + "${progress.supportFileName}"
            def file = new File(fileName)
            return file.exists()
        }
    }

    def saveProgress(Progress progress) {
        if (progress == null) {
            notFound()
            return
        }
        try {
            progressService.save(progress)
            flash.message = message(code: 'default.created.message', args: [message(code: 'progress.label', default: 'Progress'), progress.id])
            if (!params.uploadedFile.empty) {
                //处理文件上传
                GString destDir = getRealFilePath(progress)
                params.destDir = destDir
                println("准备上传...")
                println(destDir)
                def sf = commonService.upload(params)
                println("上传${sf}成功...")
            }
        } catch (ValidationException e) {
            flash.message = e.message
        }
        redirect(action: "index")
    }

    private GString getRealFilePath(Progress progress) {
        def key = "${Environment.current}.${params.controller}"
        def target = DataRootPath.findByKeyString(key).rootPath;
        println("当前环境：${key} ${target}")
        def destDir = "${target}/documents/${progress.id}"
        destDir
    }

    def doFixSupportFile() {

        println("更新文件 ${params}")
        def progress = progressService.get(params.id)
        progress.supportFileName = params.supportFileName
        progressService.save(progress)

        uploadFile(params, progress)

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        if (controller == "") {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def fixSupportFile(Long id) {

        println("${params}")

        def view = "fixSupportFile4Progress"
        if (params.view) {
            view = params.view
        }

        def progress = progressService.get(id)

        println("编辑${progress}")

        if (request.xhr) {
            render(template: view, model: [progress: progress])
        } else {
            respond progress
        }
    }

    def createNextProgress() {
        def prevProgress = progressService.get(params.prevProgress)
        def currentProjectPlan = ProjectPlan.get(params.currentProjectPlan)
        def myself = session.systemUser.person()
        def progress
        if (prevProgress) {
            progress = new Progress(
                    team: prevProgress.team,
                    prevProgress: prevProgress,
                    contributor: myself
            )
            setupDate(prevProgress, progress)
        } else {
            progress = new Progress(
                    team: currentProjectPlan.team,
                    contributor: myself
            )
        }
        def view = "createProgress"
        if (request.xhr) {
            render(template: view, model: [progress: progress, needToDo: params.needToDo])
        } else {
            respond progress
        }
    }

    private void setupDate(Progress prevProgress, Progress progress) {
        Date prev = prevProgress.regDate
        Date now = progress.regDate
        def dif = (now.getTime() - prev.getTime()) / 1000 / 60
        println("时间差：${dif}")
        if (dif < 1) {
            def year = prevProgress.regDate[Calendar.YEAR]
            def month = prevProgress.regDate[Calendar.MONTH]
            def day = prevProgress.regDate[Calendar.DATE]
            def hour = prevProgress.regDate[Calendar.HOUR_OF_DAY]
            def minute = prevProgress.regDate[Calendar.MINUTE] + 1
            println("时间没有错开！${year} ${month} ${day} ${hour} ${minute}")
            //progress.regDate = new Date(year: year, month: month, date: day, hours: hour, minutes: minute)    //不对--完全是乱的
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm")
            progress.regDate = df.parse("${year}-${month + 1}-${day} ${hour}:${minute}")    // 月份+1
            println("修正后的时间：${progress.regDate}")
        } else {
            println("两个时间：${prevProgress.regDate} ${prevProgress.regDate}")
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }
        def progress = new Progress(params)
        //参数处理
        def pre = progressService.get(params.preProgress)
        if (pre) {
            progress.prevProgress = pre
            progress.team = pre.team
        }
        progress.contributor = session.systemUser.person()

        if (request.xhr) {
            render(template: view, model: [progress: progress])
        } else {
            respond progress
        }
    }

    protected void prepareParams() {

        // 首先获取当前任务
        def myself = session.systemUser.person()
        def projectList = ThingType.findByName("科研项目").relatedThingTypeList()
        def courseList = ThingType.findByName("教学任务").relatedThingTypeList()
        def sql = new Sql(dataSource)

        switch (params.key) {
            case "领导的项目":
                params.myself = myself
                params.thingTypeList = projectList
                break
            case "参与的项目":
                List c = relatedTeamList(sql, myself)
                params.relatedTeams = c
                params.thingTypeList = projectList
                break
            case "待启动项目":
                def startedTeamList = Progress.executeQuery("select distinct progress.team from Progress progress")
                def allRelatedTeamList = allRelatedTeamList(sql, myself)
                params.startedTeamList = startedTeamList
                params.allRelatedTeamList = allRelatedTeamList
                break
            case "我的进展":
                params.myself = myself
                break
            case "我的课程":    //课程需要单独处理
                params.myself = myself
                params.thingTypeList = courseList
                break
            case "本周进展统计":
                params.myself = myself.id
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(new Date());
                //System.out.println(calendar.get(Calendar.DAY_OF_MONTH));//今天的日期
                calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH) - 7);//让日期加1
                //System.out.println(calendar.get(Calendar.DATE));//加1之后的日期Top
                //println("日期：${calendar.getTime()}")
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
                params.startDate = sf.format(calendar.getTime())
                break
            case "进展统计":
                params.myself = myself.id
                break
            case "带队的课程":
                params.myself = myself
                params.thingTypeList = courseList
                break
            case "参与的课程":
                params.myself = myself.id
                def pidlist = []
                courseList.each { e -> pidlist.add(e.id) }
                params.thingTypeList = pidlist
                break
            case "我的登录":
                params.myself = myself
                params.myself = myself.name
                break
        }
    }

    private List allRelatedTeamList(Sql sql, myself) {
        def c = Team.findAllByLeader(myself)    //先找到领导的团队
        sql.eachRow("select team_members_id from team_person where person_id=${myself.id}") { e ->
            //println("${e}")
            def t = Team.get(e.team_members_id)
            c.add(t)    // 再加入参与的团队
        }
        println("相关团队：${c}")
        c
    }

    private List relatedTeamList(Sql sql, myself) {
        def c = []
        sql.eachRow("select team_members_id from team_person where person_id=${myself.id}") { e ->
            //println("${e}")
            def t = Team.get(e.team_members_id)
            c.add(t)
        }
        println("相关团队：${c}")
        c
    }

    protected def processResult(result, params) {
        switch (params.key) {
            case "本周进展统计":
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(new Date());
                calendar.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH) - 7);//让日期加1
                def dscope = Progress.executeQuery("select min(progress.regDate), max(progress.regDate) from Progress progress")[0]
                println("${dscope}")
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd"); //java.sql.Timestamp
                def scope = []
                dscope.each { e ->
                    scope.add(sf.format(e))
                }
                scope[0] = sf.format(calendar.getTime())
                result.scope = scope
                break
            case "进展统计":
                def dscope = Progress.executeQuery("select min(progress.regDate), max(progress.regDate) from Progress progress")[0]
                println("${dscope}")
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd"); //java.sql.Timestamp
                def scope = []
                dscope.each { e ->
                    //def ee = sf.parse(e)
                    scope.add(sf.format(e))
                }
                result.scope = scope
                break
        }
        return result
    }

    def index() {}
}
