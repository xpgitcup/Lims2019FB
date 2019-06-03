package cn.edu.cup.system

import grails.gorm.services.Service

@Service(QueryStatementA)
interface QueryStatementAService {

    QueryStatementA get(Serializable id)

    List<QueryStatementA> list(Map args)

    Long count()

    void delete(Serializable id)

    QueryStatementA save(QueryStatementA queryStatementA)

}