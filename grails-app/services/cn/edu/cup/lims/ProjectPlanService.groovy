package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(ProjectPlan)
interface ProjectPlanService {

    ProjectPlan get(Serializable id)

    List<ProjectPlan> list(Map args)

    Long count()

    void delete(Serializable id)

    ProjectPlan save(ProjectPlan projectPlan)

}