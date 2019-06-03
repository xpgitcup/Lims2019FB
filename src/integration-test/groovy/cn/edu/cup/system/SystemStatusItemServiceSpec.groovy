package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SystemStatusItemServiceSpec extends Specification {

    SystemStatusItemService systemStatusItemService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new SystemStatusItem(...).save(flush: true, failOnError: true)
        //new SystemStatusItem(...).save(flush: true, failOnError: true)
        //SystemStatusItem systemStatusItem = new SystemStatusItem(...).save(flush: true, failOnError: true)
        //new SystemStatusItem(...).save(flush: true, failOnError: true)
        //new SystemStatusItem(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //systemStatusItem.id
    }

    void "test get"() {
        setupData()

        expect:
        systemStatusItemService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<SystemStatusItem> systemStatusItemList = systemStatusItemService.list(max: 2, offset: 2)

        then:
        systemStatusItemList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        systemStatusItemService.count() == 5
    }

    void "test delete"() {
        Long systemStatusItemId = setupData()

        expect:
        systemStatusItemService.count() == 5

        when:
        systemStatusItemService.delete(systemStatusItemId)
        sessionFactory.currentSession.flush()

        then:
        systemStatusItemService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        SystemStatusItem systemStatusItem = new SystemStatusItem()
        systemStatusItemService.save(systemStatusItem)

        then:
        systemStatusItem.id != null
    }
}
