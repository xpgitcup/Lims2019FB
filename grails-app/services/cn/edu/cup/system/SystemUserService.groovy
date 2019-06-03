package cn.edu.cup.system

import grails.gorm.services.Service

@Service(SystemUser)
interface SystemUserService {

    SystemUser get(Serializable id)

    List<SystemUser> list(Map args)

    Long count()

    void delete(Serializable id)

    SystemUser save(SystemUser systemUser)

}