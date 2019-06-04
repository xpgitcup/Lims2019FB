package cn.edu.cup.basic

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class CaptionServiceSpec extends Specification {

    CaptionService captionService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Caption(...).save(flush: true, failOnError: true)
        //new Caption(...).save(flush: true, failOnError: true)
        //Caption caption = new Caption(...).save(flush: true, failOnError: true)
        //new Caption(...).save(flush: true, failOnError: true)
        //new Caption(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //caption.id
    }

    void "test get"() {
        setupData()

        expect:
        captionService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Caption> captionList = captionService.list(max: 2, offset: 2)

        then:
        captionList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        captionService.count() == 5
    }

    void "test delete"() {
        Long captionId = setupData()

        expect:
        captionService.count() == 5

        when:
        captionService.delete(captionId)
        sessionFactory.currentSession.flush()

        then:
        captionService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Caption caption = new Caption()
        captionService.save(caption)

        then:
        caption.id != null
    }
}
