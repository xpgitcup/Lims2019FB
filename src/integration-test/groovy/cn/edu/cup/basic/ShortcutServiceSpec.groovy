package cn.edu.cup.basic

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ShortcutServiceSpec extends Specification {

    ShortcutService shortcutService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Shortcut(...).save(flush: true, failOnError: true)
        //new Shortcut(...).save(flush: true, failOnError: true)
        //Shortcut shortcut = new Shortcut(...).save(flush: true, failOnError: true)
        //new Shortcut(...).save(flush: true, failOnError: true)
        //new Shortcut(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //shortcut.id
    }

    void "test get"() {
        setupData()

        expect:
        shortcutService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Shortcut> shortcutList = shortcutService.list(max: 2, offset: 2)

        then:
        shortcutList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        shortcutService.count() == 5
    }

    void "test delete"() {
        Long shortcutId = setupData()

        expect:
        shortcutService.count() == 5

        when:
        shortcutService.delete(shortcutId)
        sessionFactory.currentSession.flush()

        then:
        shortcutService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Shortcut shortcut = new Shortcut()
        shortcutService.save(shortcut)

        then:
        shortcut.id != null
    }
}
