package cn.edu.cup.operation

import cn.edu.cup.basic.PersonController
import cn.edu.cup.basic.PersonTitle
import cn.edu.cup.lims.Team
import cn.edu.cup.lims.ThingType
import groovy.sql.Sql

import java.text.SimpleDateFormat

class Operation4PersonController extends PersonController {

    def systemCommonService

    def removeFromSystemUser() {
        switch (params.key) {
            case "student":
                def student = personService.get(params.id)
                if (!student) {
                    flash.message = "${params.id} -- 找不到学生。"
                } else {
                    systemCommonService.removePersonFromUser(student)
                }
                break
            case "teacher":
                def teacher = personService.get(params.id)
                if (!teacher) {
                    flash.message = "${params.id} -- 找不到。"
                } else {
                    systemCommonService.removePersonFromUser(teacher)
                }
                break
        }
        redirect(action: "index")
    }

    def addToSystemUser() {
        switch (params.key) {
            case "student":
                def student = personService.get(params.id)
                systemCommonService.addPersonToUser(student)
                break
            case "teacher":
                def teacher = personService.get(params.id)
                systemCommonService.addPersonToUser(teacher)
                break;
        }
        redirect(action: "index")
    }

    protected void prepareParams() {

        switch (params.key) {
            case "教师":
                params.titleList = PersonTitle.findByName("教师").relatedTitles()
                break
            case "本科生":
                params.titleList = PersonTitle.findAllByName("本科生")
                break
            case "研究生":
                params.titleList = PersonTitle.findByName("研究生").relatedTitles()
                break
        }
    }

    def index() {}
}
