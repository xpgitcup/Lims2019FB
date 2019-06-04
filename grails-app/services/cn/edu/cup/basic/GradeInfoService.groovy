package cn.edu.cup.basic

import grails.gorm.services.Service

@Service(GradeInfo)
interface GradeInfoService {

    GradeInfo get(Serializable id)

    List<GradeInfo> list(Map args)

    Long count()

    void delete(Serializable id)

    GradeInfo save(GradeInfo gradeInfo)

}