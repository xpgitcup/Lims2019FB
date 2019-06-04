package cn.edu.cup.basic

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class GradeInfoServiceSpec extends Specification {

    GradeInfoService gradeInfoService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new GradeInfo(...).save(flush: true, failOnError: true)
        //new GradeInfo(...).save(flush: true, failOnError: true)
        //GradeInfo gradeInfo = new GradeInfo(...).save(flush: true, failOnError: true)
        //new GradeInfo(...).save(flush: true, failOnError: true)
        //new GradeInfo(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //gradeInfo.id
    }

    void "test get"() {
        setupData()

        expect:
        gradeInfoService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<GradeInfo> gradeInfoList = gradeInfoService.list(max: 2, offset: 2)

        then:
        gradeInfoList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        gradeInfoService.count() == 5
    }

    void "test delete"() {
        Long gradeInfoId = setupData()

        expect:
        gradeInfoService.count() == 5

        when:
        gradeInfoService.delete(gradeInfoId)
        sessionFactory.currentSession.flush()

        then:
        gradeInfoService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        GradeInfo gradeInfo = new GradeInfo()
        gradeInfoService.save(gradeInfo)

        then:
        gradeInfo.id != null
    }
}
