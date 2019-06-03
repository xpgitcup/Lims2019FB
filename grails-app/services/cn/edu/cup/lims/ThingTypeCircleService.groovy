package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(ThingTypeCircle)
interface ThingTypeCircleService {

    ThingTypeCircle get(Serializable id)

    List<ThingTypeCircle> list(Map args)

    Long count()

    void delete(Serializable id)

    ThingTypeCircle save(ThingTypeCircle thingTypeCircle)

}