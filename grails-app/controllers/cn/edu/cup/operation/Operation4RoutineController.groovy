package cn.edu.cup.operation

import cn.edu.cup.common.CommonController
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.ThingType

class Operation4RoutineController extends CommonController {

    protected void prepareParams() {

        // 首先获取当前任务
        def myself = session.systemUser.person()
        def currentTitle = session.systemUser.personTitle()
        def projectList = ThingType.findByName("科研项目").relatedThingTypeList()
        def courseList = ThingType.findByName("教学任务").relatedThingTypeList()

        params.myself = myself

        switch (params.key) {
            case "我的进展":
                break
            case "领导的项目":
                params.thingTypeList = projectList
                break
            case "带队的课程":
                params.thingTypeList = courseList
                break
            case "参与的项目":
                params.myself = myself.id
                def pidlist = []
                projectList.each { e -> pidlist.add(e.id) }
                params.thingTypeList = pidlist
                break
            case "参与的课程":
                params.myself = myself.id
                def pidlist = []
                courseList.each { e -> pidlist.add(e.id) }
                params.thingTypeList = pidlist
                break
            case "我的课程":    //课程需要单独处理
                params.thingTypeList = courseList
                break
            case "我的登录":
                params.myself = myself.name
                break
        }
    }

    protected def processResult(result, params) {
        switch (params.key) {
            case "队员列表":
                def currentTeam = Team.get(params.currentTeam)
                if (currentTeam) {
                    result.objectList = [currentTeam]
                    result.team = currentTeam
                    result.members = currentTeam.members.sort() { a, b ->
                        a.code.compareTo(b.code)
                    }
                    //result.view = "listMember"
                    result.view = "listMemberLeft"
                }
                break
            case "参与的项目":
            case "参与的课程":
                def teams = []
                println("结果：${result}")
                result.objectList.each { e ->
                    println("查找 ${e}")
                    teams.add(Team.get(e.team_members_id))
                }
                println("转换后：${teams}")
                result.objectList = teams
                break
        }
        return result
    }

    def index() {}
}
