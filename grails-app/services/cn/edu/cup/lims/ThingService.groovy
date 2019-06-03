package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(Thing)
interface ThingService {

    Thing get(Serializable id)

    List<Thing> list(Map args)

    Long count()

    void delete(Serializable id)

    Thing save(Thing thing)

}