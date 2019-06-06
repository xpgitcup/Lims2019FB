package cn.edu.cup.operation

import cn.edu.cup.common.CommonController

class Operation4RoutineController extends CommonController {

    protected void prepareParams() {

        // 首先获取当前任务
        def myself = session.systemUser.person()
        def currentTitle = session.systemUser.personTitle()

        params.myself = myself

        switch (params.key) {
            case "我的进展":
                break
            case "我的项目":
                break
            case "我参与的":
                break
            case "我的课程":
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
            case "我参与的":
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
