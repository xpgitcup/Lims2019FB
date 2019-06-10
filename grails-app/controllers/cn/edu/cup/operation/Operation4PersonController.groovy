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

        // 首先获取当前任务
        def teacher = PersonTitle.findByName("教师").relatedTitles()
        def student = PersonTitle.findByName("学生").relatedTitles()

        switch (params.key) {
            case "教师":
                params.titleList = teacher
                break
            case "学生":
                params.titleList = student
                break
        }
    }

    def index() {}
}
