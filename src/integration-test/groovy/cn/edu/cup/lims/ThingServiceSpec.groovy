package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ThingServiceSpec extends Specification {

    ThingService thingService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Thing(...).save(flush: true, failOnError: true)
        //new Thing(...).save(flush: true, failOnError: true)
        //Thing thing = new Thing(...).save(flush: true, failOnError: true)
        //new Thing(...).save(flush: true, failOnError: true)
        //new Thing(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //thing.id
    }

    void "test get"() {
        setupData()

        expect:
        thingService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Thing> thingList = thingService.list(max: 2, offset: 2)

        then:
        thingList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        thingService.count() == 5
    }

    void "test delete"() {
        Long thingId = setupData()

        expect:
        thingService.count() == 5

        when:
        thingService.delete(thingId)
        sessionFactory.currentSession.flush()

        then:
        thingService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Thing thing = new Thing()
        thingService.save(thing)

        then:
        thing.id != null
    }
}
