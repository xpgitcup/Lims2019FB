package cn.edu.cup.lims

import grails.gorm.services.Service

@Service(Progress)
interface ProgressService {

    Progress get(Serializable id)

    List<Progress> list(Map args)

    Long count()

    void delete(Serializable id)

    Progress save(Progress progress)

}