package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class MajorController extends cn.edu.cup.common.CommonController {

    MajorService majorService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.majorTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.majorJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond majorService.list(params), model:[majorCount: majorService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def major = majorService.get(id)

        if (request.xhr) {
            render(template: view, model: [major: major])
        } else {
            respond major
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def major = new Major(params)

        if (request.xhr) {
            render(template: view, model: [major: major])
        } else {
            respond major
        }
    }

    def save(Major major) {

        if (major == null) {
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
            majorService.save(major)
            flash.message = message(code: 'default.created.message', args: [message(code: 'major.label', default: 'Major'), major.id])
        } catch (ValidationException e) {
            flash.message = major.errors
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

        def major = majorService.get(id)

        if (request.xhr) {
            render(template: view, model: [major: major])
        } else {
            respond major
        }
    }

    def update(Major major) {
        if (major == null) {
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
            majorService.save(major)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'major.label', default: 'Major'), major.id])
        } catch (ValidationException e) {
            flash.message = major.errors
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

        majorService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'major.label', default: 'Major'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'major.label', default: 'Major'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
