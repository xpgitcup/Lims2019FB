package cn.edu.cup.system

import grails.gorm.services.Service

@Service(StatusParameter)
interface StatusParameterService {

    StatusParameter get(Serializable id)

    List<StatusParameter> list(Map args)

    Long count()

    void delete(Serializable id)

    StatusParameter save(StatusParameter statusParameter)

}