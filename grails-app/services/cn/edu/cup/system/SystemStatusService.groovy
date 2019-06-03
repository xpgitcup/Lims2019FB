package cn.edu.cup.system

import grails.gorm.services.Service

@Service(SystemStatus)
interface SystemStatusService {

    SystemStatus get(Serializable id)

    List<SystemStatus> list(Map args)

    Long count()

    void delete(Serializable id)

    SystemStatus save(SystemStatus systemStatus)

}