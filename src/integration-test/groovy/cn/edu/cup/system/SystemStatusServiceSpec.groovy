package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SystemStatusServiceSpec extends Specification {

    SystemStatusService systemStatusService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new SystemStatus(...).save(flush: true, failOnError: true)
        //new SystemStatus(...).save(flush: true, failOnError: true)
        //SystemStatus systemStatus = new SystemStatus(...).save(flush: true, failOnError: true)
        //new SystemStatus(...).save(flush: true, failOnError: true)
        //new SystemStatus(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //systemStatus.id
    }

    void "test get"() {
        setupData()

        expect:
        systemStatusService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<SystemStatus> systemStatusList = systemStatusService.list(max: 2, offset: 2)

        then:
        systemStatusList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        systemStatusService.count() == 5
    }

    void "test delete"() {
        Long systemStatusId = setupData()

        expect:
        systemStatusService.count() == 5

        when:
        systemStatusService.delete(systemStatusId)
        sessionFactory.currentSession.flush()

        then:
        systemStatusService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        SystemStatus systemStatus = new SystemStatus()
        systemStatusService.save(systemStatus)

        then:
        systemStatus.id != null
    }
}
