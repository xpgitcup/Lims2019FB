package cn.edu.cup.operation

import cn.edu.cup.basic.GroupInfo
import cn.edu.cup.basic.GroupInfoController
import cn.edu.cup.basic.Person
import cn.edu.cup.basic.PersonTitle
import groovy.sql.Sql

class Operation4OrganizationController extends GroupInfoController {

    def dataSource



    protected void prepareParams() {

        switch (params.key) {
            case "教师":
                params.titleList = PersonTitle.findByName("教师").relatedTitles()
                if (params.leader) {
                    //println("---->${params}")
                    def g = GroupInfo.findByName(params.leader)
                    if (g) {
                        //println("${g}的领导。。。")
                        params.remove("leader")
                        params.like = g.leader.code
                    } else {
                        params.remove("leader")
                    }
                }
                break
            case "课题组":
                break
            case "课题组成员列表":
                if (params.like) {
                    def group = GroupInfo.findByName(params.like)

                }
                break
        }
    }

    protected def processResult(result, params) {
        switch (params.key) {
            case "教师":
                def memberCountList = [:]
                def sql = new Sql(dataSource)
                result.objectList.each { e ->
                    sql.eachRow("select count(*) from group_info_person where person_id=${e.id}") { ee ->
                        println("${ee} ${ee[0].value}")
                        memberCountList.put(e, ee[0].value)
                    }
                }
                result.memberCountList = memberCountList
                break
            case "课题组":

                break
        }
        return result
    }

    def index() {}
}
