package cn.edu.cup.basic

import grails.gorm.services.Service

@Service(GroupInfo)
interface GroupInfoService {

    GroupInfo get(Serializable id)

    List<GroupInfo> list(Map args)

    Long count()

    void delete(Serializable id)

    GroupInfo save(GroupInfo groupInfo)

}