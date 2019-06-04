package cn.edu.cup.system

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class StatusParameterController extends cn.edu.cup.common.CommonController {

    StatusParameterService statusParameterService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.statusParameterTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.statusParameterJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond statusParameterService.list(params), model:[statusParameterCount: statusParameterService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def statusParameter = statusParameterService.get(id)

        if (request.xhr) {
            render(template: view, model: [statusParameter: statusParameter])
        } else {
            respond statusParameter
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def statusParameter = new StatusParameter(params)

        if (request.xhr) {
            render(template: view, model: [statusParameter: statusParameter])
        } else {
            respond statusParameter
        }
    }

    def save(StatusParameter statusParameter) {

        if (statusParameter == null) {
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
            statusParameterService.save(statusParameter)
            flash.message = message(code: 'default.created.message', args: [message(code: 'statusParameter.label', default: 'StatusParameter'), statusParameter.id])
        } catch (ValidationException e) {
            flash.message = statusParameter.errors
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

        def statusParameter = statusParameterService.get(id)

        if (request.xhr) {
            render(template: view, model: [statusParameter: statusParameter])
        } else {
            respond statusParameter
        }
    }

    def update(StatusParameter statusParameter) {
        if (statusParameter == null) {
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
            statusParameterService.save(statusParameter)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'statusParameter.label', default: 'StatusParameter'), statusParameter.id])
        } catch (ValidationException e) {
            flash.message = statusParameter.errors
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

        statusParameterService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'statusParameter.label', default: 'StatusParameter'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusParameter.label', default: 'StatusParameter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
