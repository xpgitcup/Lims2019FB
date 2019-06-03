package cn.edu.cup.basic

import grails.gorm.services.Service

@Service(Caption)
interface CaptionService {

    Caption get(Serializable id)

    List<Caption> list(Map args)

    Long count()

    void delete(Serializable id)

    Caption save(Caption caption)

}