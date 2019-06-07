package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ProjectPlanServiceSpec extends Specification {

    ProjectPlanService projectPlanService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new ProjectPlan(...).save(flush: true, failOnError: true)
        //new ProjectPlan(...).save(flush: true, failOnError: true)
        //ProjectPlan projectPlan = new ProjectPlan(...).save(flush: true, failOnError: true)
        //new ProjectPlan(...).save(flush: true, failOnError: true)
        //new ProjectPlan(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //projectPlan.id
    }

    void "test get"() {
        setupData()

        expect:
        projectPlanService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<ProjectPlan> projectPlanList = projectPlanService.list(max: 2, offset: 2)

        then:
        projectPlanList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        projectPlanService.count() == 5
    }

    void "test delete"() {
        Long projectPlanId = setupData()

        expect:
        projectPlanService.count() == 5

        when:
        projectPlanService.delete(projectPlanId)
        sessionFactory.currentSession.flush()

        then:
        projectPlanService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        ProjectPlan projectPlan = new ProjectPlan()
        projectPlanService.save(projectPlan)

        then:
        projectPlan.id != null
    }
}
