package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class QueryStatementServiceSpec extends Specification {

    QueryStatementService queryStatementService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new QueryStatement(...).save(flush: true, failOnError: true)
        //new QueryStatement(...).save(flush: true, failOnError: true)
        //QueryStatement queryStatement = new QueryStatement(...).save(flush: true, failOnError: true)
        //new QueryStatement(...).save(flush: true, failOnError: true)
        //new QueryStatement(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //queryStatement.id
    }

    void "test get"() {
        setupData()

        expect:
        queryStatementService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<QueryStatement> queryStatementList = queryStatementService.list(max: 2, offset: 2)

        then:
        queryStatementList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        queryStatementService.count() == 5
    }

    void "test delete"() {
        Long queryStatementId = setupData()

        expect:
        queryStatementService.count() == 5

        when:
        queryStatementService.delete(queryStatementId)
        sessionFactory.currentSession.flush()

        then:
        queryStatementService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        QueryStatement queryStatement = new QueryStatement()
        queryStatementService.save(queryStatement)

        then:
        queryStatement.id != null
    }
}
