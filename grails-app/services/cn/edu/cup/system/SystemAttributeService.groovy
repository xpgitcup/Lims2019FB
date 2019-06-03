package cn.edu.cup.system

import grails.gorm.services.Service

@Service(SystemAttribute)
interface SystemAttributeService {

    SystemAttribute get(Serializable id)

    List<SystemAttribute> list(Map args)

    Long count()

    void delete(Serializable id)

    SystemAttribute save(SystemAttribute systemAttribute)

}