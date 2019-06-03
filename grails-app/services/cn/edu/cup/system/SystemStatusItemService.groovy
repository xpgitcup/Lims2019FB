package cn.edu.cup.system

import grails.gorm.services.Service

@Service(SystemStatusItem)
interface SystemStatusItemService {

    SystemStatusItem get(Serializable id)

    List<SystemStatusItem> list(Map args)

    Long count()

    void delete(Serializable id)

    SystemStatusItem save(SystemStatusItem systemStatusItem)

}