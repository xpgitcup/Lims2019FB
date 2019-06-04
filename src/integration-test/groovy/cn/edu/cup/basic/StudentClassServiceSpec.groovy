package cn.edu.cup.basic

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class StudentClassServiceSpec extends Specification {

    StudentClassService studentClassService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new StudentClass(...).save(flush: true, failOnError: true)
        //new StudentClass(...).save(flush: true, failOnError: true)
        //StudentClass studentClass = new StudentClass(...).save(flush: true, failOnError: true)
        //new StudentClass(...).save(flush: true, failOnError: true)
        //new StudentClass(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //studentClass.id
    }

    void "test get"() {
        setupData()

        expect:
        studentClassService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<StudentClass> studentClassList = studentClassService.list(max: 2, offset: 2)

        then:
        studentClassList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        studentClassService.count() == 5
    }

    void "test delete"() {
        Long studentClassId = setupData()

        expect:
        studentClassService.count() == 5

        when:
        studentClassService.delete(studentClassId)
        sessionFactory.currentSession.flush()

        then:
        studentClassService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        StudentClass studentClass = new StudentClass()
        studentClassService.save(studentClass)

        then:
        studentClass.id != null
    }
}
