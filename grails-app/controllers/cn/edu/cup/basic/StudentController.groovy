package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class StudentController extends cn.edu.cup.common.CommonController {

    StudentService studentService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.studentTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.studentJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond studentService.list(params), model:[studentCount: studentService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def student = studentService.get(id)

        if (request.xhr) {
            render(template: view, model: [student: student])
        } else {
            respond student
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def student = new Student(params)

        if (request.xhr) {
            render(template: view, model: [student: student])
        } else {
            respond student
        }
    }

    def save(Student student) {

        if (student == null) {
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
            studentService.save(student)
            flash.message = message(code: 'default.created.message', args: [message(code: 'student.label', default: 'Student'), student.id])
        } catch (ValidationException e) {
            flash.message = student.errors
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

        def student = studentService.get(id)

        if (request.xhr) {
            render(template: view, model: [student: student])
        } else {
            respond student
        }
    }

    def update(Student student) {
        if (student == null) {
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
            studentService.save(student)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'student.label', default: 'Student'), student.id])
        } catch (ValidationException e) {
            flash.message = student.errors
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

        studentService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'student.label', default: 'Student'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'student.label', default: 'Student'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
