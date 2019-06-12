package cn.edu.cup.operation

import cn.edu.cup.basic.GroupInfoController
import cn.edu.cup.basic.Person
import cn.edu.cup.basic.PersonTitle
import groovy.sql.Sql

class Operation4OrganizationController extends GroupInfoController {

    def dataSource

    /*
     * 招聘
     * */

    def recruit() {
        def person = Person.findByName(params.name)
        if (person) {
            def group = groupInfoService.get(params.group)
            if (!group.members.contains(person)) {
                group.members.add(person)
                groupInfoService.save(group)
            } else {
                flash.message = "已经加入了!"
            }
        } else {
            flash.message = "找不到${params.name}！"
        }
        chain(action: "index")
    }

    protected void prepareParams() {

        switch (params.key) {
            case "教师":
                params.titleList = PersonTitle.findByName("教师").relatedTitles()
                break
            case "课题组":
                break
        }
    }

    protected def processResult(result, params) {
        switch (params.key) {
            case "教师":
                def isMemberList = [:]
                def sql = new Sql(dataSource)
                result.objectList.each { e ->
                    sql.eachRow("select count(*) from group_info_person where person_id=${e.id}") { ee ->
                        println("${ee}")
                        //isMemberList.put(e, ee.value)
                    }
                }
                break
        }
        return result
    }

    def index() {}
}
