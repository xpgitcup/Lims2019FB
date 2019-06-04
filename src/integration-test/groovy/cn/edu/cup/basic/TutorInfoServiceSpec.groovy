package cn.edu.cup.basic

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TutorInfoServiceSpec extends Specification {

    TutorInfoService tutorInfoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new TutorInfo(...).save(flush: true, failOnError: true)
        //new TutorInfo(...).save(flush: true, failOnError: true)
        //TutorInfo tutorInfo = new TutorInfo(...).save(flush: true, failOnError: true)
        //new TutorInfo(...).save(flush: true, failOnError: true)
        //new TutorInfo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //tutorInfo.id
    }

    void "test get"() {
        setupData()

        expect:
        tutorInfoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<TutorInfo> tutorInfoList = tutorInfoService.list(max: 2, offset: 2)

        then:
        tutorInfoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        tutorInfoService.count() == 5
    }

    void "test delete"() {
        Long tutorInfoId = setupData()

        expect:
        tutorInfoService.count() == 5

        when:
        tutorInfoService.delete(tutorInfoId)
        sessionFactory.currentSession.flush()

        then:
        tutorInfoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        TutorInfo tutorInfo = new TutorInfo()
        tutorInfoService.save(tutorInfo)

        then:
        tutorInfo.id != null
    }
}
