package cn.edu.cup.common

import cn.edu.cup.basic.Person
import cn.edu.cup.basic.PersonTitle
import cn.edu.cup.lims.Course
import cn.edu.cup.lims.Project
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.Thing
import cn.edu.cup.lims.ThingType
import groovy.sql.Sql

class DatabaseController {

    def theSQL
    def commonService
    def personService
    def projectService
    def courseService
    def teamService

    def importThing() {
        def myself = session.systemUser.person()
        def qstring = "select a.*, b.name As thingType from thing a, thing_type b where a.thing_type_id=b.id order by a.id"
        theSQL.eachRow(qstring) { e ->
            def tt = ThingType.findByName(e.thingType)
            println("${e} ${tt}")
            if (Thing.countByName(e.name) < 1) {
                println("新增：${e.name}")
                switch (e.class) {
                    case "cn.edu.cup.lims.Project":
                        def p = new Project(
                                name: e.name,
                                sponsor: myself,
                                companyA: e.companyA,
                                startDate: e.start_date,
                                duration: e.duration,
                                thingType: tt
                        );
                        projectService.save(p)
                        println("项目：${p}")
                        break
                    case "cn.edu.cup.lims.Course":
                        def c = new Course(
                                name: e.name,
                                sponsor: myself,
                                code: "请编辑",
                                school_year: e.school_year,
                                thingType: tt
                        )
                        courseService.save(c)
                        println("课程：${c}")
                        break
                }
            }
        }
        redirect(action: "index")
    }

    def importTeamMember() {
        def qstring = "select a.team_members_id, d.name, c.code from team_person a, team b, person c, thing d where a.team_members_id=b.id and a.person_id=c.id and b.thing_id=d.id"
        def mlist = []
        theSQL.eachRow(qstring) { e ->
            //println("${e} ")
            def thing = Thing.findByName(e.name)
            def person = Person.findByCode(e.code)
            def m = [:]
            m.put("id", e.team_members_id)
            m.put("thing", thing)
            m.put("person", person)
            mlist.add(m)
            //println("${m}")
        }
        println("----------------------------------------")
        mlist.each { e->
            qstring = "select a.id, b.name AS thingName, c.name, c.code  from team a, thing b, person c where a.id=${e.id} and a.thing_id=b.id and a.leader_id=c.id"
            theSQL.eachRow(qstring) { ee->
                println("${ee}")
                def leader = Person.findByCode(ee.code)
                def thing = Thing.findByName(ee.thingName)
                def t = Team.findByThingAndLeader(thing, leader)
                println("找到团队：${t} ${t.members.size()} ${e.person}")
                if (!(t.members.contains(e.person))) {
                    t.members.add(e.person)
                    teamService.save(t)
                    println("${t.members}")
                }
            }
        }

        redirect(action: "index")
    }

    def importTeam() {
        def qstring = "select a.thing_id, a.leader_id,  b.code, c.name from team a, person b, thing c where a.leader_id=b.id and a.thing_id=c.id order by a.id"
        theSQL.eachRow(qstring) { e ->
            println("${e} ${e.code} ${e.name}")
            def thing = Thing.findByName(e.name)
            def person = Person.findByCode(e.code)
            println("事情：${thing} 队长：${person}")
            if (Team.countByThingAndLeader(thing, person)<1) {
                def t = new Team(
                        thing: thing,
                        leader: person
                )
                t.save()
            }
        }

        redirect(action: "index")
    }

    def importPerson() {
        def qstring = "select a.name, a.code, b.name AS title from person a, person_title b where a.person_title_id=b.id order by a.id"
        theSQL.eachRow(qstring) { e ->
            def pt = PersonTitle.findByName(e.title)
            if (!pt) {
                pt = PersonTitle.findByName("本科生")
            }
            println("${e} ${e.title} == ${pt}")
            if (Person.countByCode(e.code) < 1) {
                def p = new Person(name: e.name, code: e.code, personTitle: pt)
                personService.save(p)
            }
        }
        redirect(action: "index")
    }

    def importProgress() {
        redirect(action: "index")
    }

    def index() {
        def driverClassName = "com.mysql.cj.jdbc.Driver";//    #升级到这个版本是为了适应MySQL 8.X
        def username = "sample";
        def password = "sample@chuyun";
        def url = "jdbc:mysql://10.1.16.50:3306/lims2019db?zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&serverTimezone=Asia/Shanghai"
        theSQL = Sql.newInstance(url, username, password, driverClassName);

        def webRoot = commonService.webRootPath
        def filename = "${webRoot}/config/otherdb.json"
        model:
        [sql: theSQL]
    }
}
