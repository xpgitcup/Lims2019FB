package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class StudentClassController extends cn.edu.cup.common.CommonController {

    StudentClassService studentClassService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.studentClassTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.studentClassJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond studentClassService.list(params), model:[studentClassCount: studentClassService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def studentClass = studentClassService.get(id)

        if (request.xhr) {
            render(template: view, model: [studentClass: studentClass])
        } else {
            respond studentClass
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def studentClass = new StudentClass(params)

        if (request.xhr) {
            render(template: view, model: [studentClass: studentClass])
        } else {
            respond studentClass
        }
    }

    def save(StudentClass studentClass) {

        if (studentClass == null) {
            notFound()
            return
        }

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = params.controller
        if (params.nextController) {
            controller = params.nextController
        }

        try {
            studentClassService.save(studentClass)
            flash.message = message(code: 'default.created.message', args: [message(code: 'studentClass.label', default: 'StudentClass'), studentClass.id])
        } catch (ValidationException e) {
            flash.message = studentClass.errors
        }

        if (params.url) {
            redirect(params.url)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def edit(Long id) {
        def view = "edit"
        if (params.view) {
            view = params.view
        }

        def studentClass = studentClassService.get(id)

        if (request.xhr) {
            render(template: view, model: [studentClass: studentClass])
        } else {
            respond studentClass
        }
    }

    def update(StudentClass studentClass) {
        if (studentClass == null) {
            notFound()
            return
        }

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        try {
            studentClassService.save(studentClass)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'studentClass.label', default: 'StudentClass'), studentClass.id])
        } catch (ValidationException e) {
            flash.message = studentClass.errors
        }

        if (controller == "")
        {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        studentClassService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'studentClass.label', default: 'StudentClass'), id])

        def action = "index"
        if (params.nextAction) {
            action = params.nextAction
        }

        def controller = ""
        if (params.nextController) {
            controller = params.nextController
        }

        if (controller == "")
        {
            redirect(action: action)
        } else {
            redirect(controller: controller, action: action)
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'studentClass.label', default: 'StudentClass'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
