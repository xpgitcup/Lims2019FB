package cn.edu.cup.system

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class DataRootPathServiceSpec extends Specification {

    DataRootPathService dataRootPathService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new DataRootPath(...).save(flush: true, failOnError: true)
        //new DataRootPath(...).save(flush: true, failOnError: true)
        //DataRootPath dataRootPath = new DataRootPath(...).save(flush: true, failOnError: true)
        //new DataRootPath(...).save(flush: true, failOnError: true)
        //new DataRootPath(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //dataRootPath.id
    }

    void "test get"() {
        setupData()

        expect:
        dataRootPathService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<DataRootPath> dataRootPathList = dataRootPathService.list(max: 2, offset: 2)

        then:
        dataRootPathList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        dataRootPathService.count() == 5
    }

    void "test delete"() {
        Long dataRootPathId = setupData()

        expect:
        dataRootPathService.count() == 5

        when:
        dataRootPathService.delete(dataRootPathId)
        sessionFactory.currentSession.flush()

        then:
        dataRootPathService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        DataRootPath dataRootPath = new DataRootPath()
        dataRootPathService.save(dataRootPath)

        then:
        dataRootPath.id != null
    }
}
