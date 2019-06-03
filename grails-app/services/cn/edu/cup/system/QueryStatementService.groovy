package cn.edu.cup.system

import grails.gorm.services.Service

@Service(QueryStatement)
interface QueryStatementService {

    QueryStatement get(Serializable id)

    List<QueryStatement> list(Map args)

    Long count()

    void delete(Serializable id)

    QueryStatement save(QueryStatement queryStatement)

}