package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SystemUserServiceSpec extends Specification {

    SystemUserService systemUserService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new SystemUser(...).save(flush: true, failOnError: true)
        //new SystemUser(...).save(flush: true, failOnError: true)
        //SystemUser systemUser = new SystemUser(...).save(flush: true, failOnError: true)
        //new SystemUser(...).save(flush: true, failOnError: true)
        //new SystemUser(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //systemUser.id
    }

    void "test get"() {
        setupData()

        expect:
        systemUserService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<SystemUser> systemUserList = systemUserService.list(max: 2, offset: 2)

        then:
        systemUserList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        systemUserService.count() == 5
    }

    void "test delete"() {
        Long systemUserId = setupData()

        expect:
        systemUserService.count() == 5

        when:
        systemUserService.delete(systemUserId)
        sessionFactory.currentSession.flush()

        then:
        systemUserService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        SystemUser systemUser = new SystemUser()
        systemUserService.save(systemUser)

        then:
        systemUser.id != null
    }
}
