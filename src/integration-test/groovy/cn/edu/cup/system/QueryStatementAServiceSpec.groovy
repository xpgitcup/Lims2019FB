package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class QueryStatementAServiceSpec extends Specification {

    QueryStatementAService queryStatementAService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new QueryStatementA(...).save(flush: true, failOnError: true)
        //new QueryStatementA(...).save(flush: true, failOnError: true)
        //QueryStatementA queryStatementA = new QueryStatementA(...).save(flush: true, failOnError: true)
        //new QueryStatementA(...).save(flush: true, failOnError: true)
        //new QueryStatementA(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //queryStatementA.id
    }

    void "test get"() {
        setupData()

        expect:
        queryStatementAService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<QueryStatementA> queryStatementAList = queryStatementAService.list(max: 2, offset: 2)

        then:
        queryStatementAList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        queryStatementAService.count() == 5
    }

    void "test delete"() {
        Long queryStatementAId = setupData()

        expect:
        queryStatementAService.count() == 5

        when:
        queryStatementAService.delete(queryStatementAId)
        sessionFactory.currentSession.flush()

        then:
        queryStatementAService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        QueryStatementA queryStatementA = new QueryStatementA()
        queryStatementAService.save(queryStatementA)

        then:
        queryStatementA.id != null
    }
}
