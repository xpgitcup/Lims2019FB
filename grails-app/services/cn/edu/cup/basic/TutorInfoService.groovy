package cn.edu.cup.basic

import grails.gorm.services.Service

@Service(TutorInfo)
interface TutorInfoService {

    TutorInfo get(Serializable id)

    List<TutorInfo> list(Map args)

    Long count()

    void delete(Serializable id)

    TutorInfo save(TutorInfo tutorInfo)

}