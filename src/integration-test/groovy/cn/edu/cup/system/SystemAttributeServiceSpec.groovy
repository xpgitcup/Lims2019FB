package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SystemAttributeServiceSpec extends Specification {

    SystemAttributeService systemAttributeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new SystemAttribute(...).save(flush: true, failOnError: true)
        //new SystemAttribute(...).save(flush: true, failOnError: true)
        //SystemAttribute systemAttribute = new SystemAttribute(...).save(flush: true, failOnError: true)
        //new SystemAttribute(...).save(flush: true, failOnError: true)
        //new SystemAttribute(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //systemAttribute.id
    }

    void "test get"() {
        setupData()

        expect:
        systemAttributeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<SystemAttribute> systemAttributeList = systemAttributeService.list(max: 2, offset: 2)

        then:
        systemAttributeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        systemAttributeService.count() == 5
    }

    void "test delete"() {
        Long systemAttributeId = setupData()

        expect:
        systemAttributeService.count() == 5

        when:
        systemAttributeService.delete(systemAttributeId)
        sessionFactory.currentSession.flush()

        then:
        systemAttributeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        SystemAttribute systemAttribute = new SystemAttribute()
        systemAttributeService.save(systemAttribute)

        then:
        systemAttribute.id != null
    }
}
