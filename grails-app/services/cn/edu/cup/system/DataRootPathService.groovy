package cn.edu.cup.system

import grails.gorm.services.Service

@Service(DataRootPath)
interface DataRootPathService {

    DataRootPath get(Serializable id)

    List<DataRootPath> list(Map args)

    Long count()

    void delete(Serializable id)

    DataRootPath save(DataRootPath dataRootPath)

}