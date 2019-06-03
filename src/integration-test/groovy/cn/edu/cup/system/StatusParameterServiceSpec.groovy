package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class StatusParameterServiceSpec extends Specification {

    StatusParameterService statusParameterService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new StatusParameter(...).save(flush: true, failOnError: true)
        //new StatusParameter(...).save(flush: true, failOnError: true)
        //StatusParameter statusParameter = new StatusParameter(...).save(flush: true, failOnError: true)
        //new StatusParameter(...).save(flush: true, failOnError: true)
        //new StatusParameter(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //statusParameter.id
    }

    void "test get"() {
        setupData()

        expect:
        statusParameterService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<StatusParameter> statusParameterList = statusParameterService.list(max: 2, offset: 2)

        then:
        statusParameterList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        statusParameterService.count() == 5
    }

    void "test delete"() {
        Long statusParameterId = setupData()

        expect:
        statusParameterService.count() == 5

        when:
        statusParameterService.delete(statusParameterId)
        sessionFactory.currentSession.flush()

        then:
        statusParameterService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        StatusParameter statusParameter = new StatusParameter()
        statusParameterService.save(statusParameter)

        then:
        statusParameter.id != null
    }
}
