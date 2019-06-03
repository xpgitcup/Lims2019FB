package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SystemMenuServiceSpec extends Specification {

    SystemMenuService systemMenuService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new SystemMenu(...).save(flush: true, failOnError: true)
        //new SystemMenu(...).save(flush: true, failOnError: true)
        //SystemMenu systemMenu = new SystemMenu(...).save(flush: true, failOnError: true)
        //new SystemMenu(...).save(flush: true, failOnError: true)
        //new SystemMenu(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //systemMenu.id
    }

    void "test get"() {
        setupData()

        expect:
        systemMenuService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<SystemMenu> systemMenuList = systemMenuService.list(max: 2, offset: 2)

        then:
        systemMenuList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        systemMenuService.count() == 5
    }

    void "test delete"() {
        Long systemMenuId = setupData()

        expect:
        systemMenuService.count() == 5

        when:
        systemMenuService.delete(systemMenuId)
        sessionFactory.currentSession.flush()

        then:
        systemMenuService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        SystemMenu systemMenu = new SystemMenu()
        systemMenuService.save(systemMenu)

        then:
        systemMenu.id != null
    }
}
