package cn.edu.cup.system

import grails.gorm.services.Service

@Service(SystemMenu)
interface SystemMenuService {

    SystemMenu get(Serializable id)

    List<SystemMenu> list(Map args)

    Long count()

    void delete(Serializable id)

    SystemMenu save(SystemMenu systemMenu)

}