package cn.edu.cup.lims

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ProjectServiceSpec extends Specification {

    ProjectService projectService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Project(...).save(flush: true, failOnError: true)
        //new Project(...).save(flush: true, failOnError: true)
        //Project project = new Project(...).save(flush: true, failOnError: true)
        //new Project(...).save(flush: true, failOnError: true)
        //new Project(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //project.id
    }

    void "test get"() {
        setupData()

        expect:
        projectService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Project> projectList = projectService.list(max: 2, offset: 2)

        then:
        projectList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        projectService.count() == 5
    }

    void "test delete"() {
        Long projectId = setupData()

        expect:
        projectService.count() == 5

        when:
        projectService.delete(projectId)
        sessionFactory.currentSession.flush()

        then:
        projectService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Project project = new Project()
        projectService.save(project)

        then:
        project.id != null
    }
}
