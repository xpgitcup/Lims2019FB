package cn.edu.cup.common

import cn.edu.cup.lims.Plan
import cn.edu.cup.lims.ProjectPlan
import cn.edu.cup.lims.Team
import grails.gorm.transactions.Transactional

@Transactional
class CommonLimsService {

    def projectPlanService

    def createProjectPlan(Team team) {
        def projectPlan = new ProjectPlan(
                upProjectPlan: null,
                description: "${team}.进度管理",
                team: team,
                precent: 0,
                updateDate: new Date(),
                serialNumber: 0
        )
        projectPlanService.save(projectPlan)
        checkProjectPlanItems(team, projectPlan)
        return projectPlan
    }

    private void checkProjectPlanItems(Team team, projectPlan) {
        if (!projectPlan.subItems) {
            def typePlan = Plan.findByThingType(team.thing.thingType)
            //println("找到同类型的计划：${typePlan}")
            if (typePlan) {
                typePlan.subItems.each { e ->
                    def newItem = new ProjectPlan(
                            upProjectPlan: projectPlan,
                            description: e.description,
                            precent: 0,
                            team: team,
                            updateDate: new Date(),
                            serialNumber: e.serialNumber
                    )
                    projectPlanService.save(newItem)
                    //println("保存item:${newItem}")
                }
            }
        }
    }

    def checkAndInitTeamProjectPlans() {
        Team.list().each { e ->
            if (ProjectPlan.countByTeam(e) < 1) {
                createProjectPlan(e)
            }
        }
    }

}
