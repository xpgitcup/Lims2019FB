package cn.edu.cup.basic

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class MajorServiceSpec extends Specification {

    MajorService majorService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Major(...).save(flush: true, failOnError: true)
        //new Major(...).save(flush: true, failOnError: true)
        //Major major = new Major(...).save(flush: true, failOnError: true)
        //new Major(...).save(flush: true, failOnError: true)
        //new Major(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //major.id
    }

    void "test get"() {
        setupData()

        expect:
        majorService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Major> majorList = majorService.list(max: 2, offset: 2)

        then:
        majorList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        majorService.count() == 5
    }

    void "test delete"() {
        Long majorId = setupData()

        expect:
        majorService.count() == 5

        when:
        majorService.delete(majorId)
        sessionFactory.currentSession.flush()

        then:
        majorService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Major major = new Major()
        majorService.save(major)

        then:
        major.id != null
    }
}
