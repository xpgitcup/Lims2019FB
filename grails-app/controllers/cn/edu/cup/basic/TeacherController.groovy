package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TeacherController extends cn.edu.cup.common.CommonController {

    TeacherService teacherService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.teacherTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.teacherJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond teacherService.list(params), model:[teacherCount: teacherService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def teacher = teacherService.get(id)

        if (request.xhr) {
            render(template: view, model: [teacher: teacher])
        } else {
            respond teacher
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def teacher = new Teacher(params)

        if (request.xhr) {
            render(template: view, model: [teacher: teacher])
        } else {
            respond teacher
        }
    }

    def save(Teacher teacher) {

        if (teacher == null) {
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
            teacherService.save(teacher)
            flash.message = message(code: 'default.created.message', args: [message(code: 'teacher.label', default: 'Teacher'), teacher.id])
        } catch (ValidationException e) {
            flash.message = teacher.errors
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

        def teacher = teacherService.get(id)

        if (request.xhr) {
            render(template: view, model: [teacher: teacher])
        } else {
            respond teacher
        }
    }

    def update(Teacher teacher) {
        if (teacher == null) {
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
            teacherService.save(teacher)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'teacher.label', default: 'Teacher'), teacher.id])
        } catch (ValidationException e) {
            flash.message = teacher.errors
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

        teacherService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'teacher.label', default: 'Teacher'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'teacher.label', default: 'Teacher'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
