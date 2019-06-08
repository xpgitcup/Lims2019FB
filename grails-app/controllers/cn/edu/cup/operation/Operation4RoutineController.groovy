package cn.edu.cup.operation

import cn.edu.cup.common.CommonController
import cn.edu.cup.lims.Progress
import cn.edu.cup.lims.ProgressController
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.ThingType
import cn.edu.cup.system.QueryStatementA
import groovy.sql.Sql

class Operation4RoutineController extends ProgressController {

    def dataSource

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

        switch (params.key) {
            case "领导的项目":
                params.myself = myself
                params.thingTypeList = projectList
                break
            case "参与的项目":
                def sql = new Sql(dataSource)
                def c = []
                sql.eachRow("select team_members_id from team_person where person_id=2") { e->
                    println("${e}")
                    def t = Team.get(e.team_members_id)
                    c.add(t)
                }
                params.relatedTeams = c
                params.thingTypeList = projectList
                break
            case "我的进展":
                params.myself = myself
                break
            case "我的课程":    //课程需要单独处理
                params.myself = myself
                params.thingTypeList = courseList
                break
            case "本周进展统计":

                break
            case "进展统计":
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

    def index() {}
}
