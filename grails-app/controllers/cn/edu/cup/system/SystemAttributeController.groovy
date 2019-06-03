package cn.edu.cup.system

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SystemAttributeController {

    SystemAttributeService systemAttributeService
    def commonQueryService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.systemAttributeTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.systemAttributeJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond systemAttributeService.list(params), model:[systemAttributeCount: systemAttributeService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def systemAttribute = systemAttributeService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemAttribute: systemAttribute])
        } else {
            respond systemAttribute
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def systemAttribute = new SystemAttribute(params)

        if (request.xhr) {
            render(template: view, model: [systemAttribute: systemAttribute])
        } else {
            respond systemAttribute
        }
    }

    def save(SystemAttribute systemAttribute) {

        if (systemAttribute == null) {
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
            systemAttributeService.save(systemAttribute)
            flash.message = message(code: 'default.created.message', args: [message(code: 'systemAttribute.label', default: 'SystemAttribute'), systemAttribute.id])
        } catch (ValidationException e) {
            flash.message = systemAttribute.errors
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

        def systemAttribute = systemAttributeService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemAttribute: systemAttribute])
        } else {
            respond systemAttribute
        }
    }

    def update(SystemAttribute systemAttribute) {
        if (systemAttribute == null) {
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
            systemAttributeService.save(systemAttribute)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'systemAttribute.label', default: 'SystemAttribute'), systemAttribute.id])
        } catch (ValidationException e) {
            flash.message = systemAttribute.errors
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

        systemAttributeService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemAttribute.label', default: 'SystemAttribute'), id])

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

    def list() {
        prepareParams()
        def result = commonQueryService.listFunction(params)
        result = processResult(result, params)
        def view = result.view
        flash.message = result.message
        if (request.xhr) {
            render(template: view, model: [objectList: result.objectList, flash: flash])
        } else {
            respond result.objectList
        }
    }

    def count() {
        prepareParams()
        def count = commonQueryService.countFunction(params)
        def result = [count: count]

        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    protected void prepareParams() {}

    protected def processResult(result, params) {
        return result
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemAttribute.label', default: 'SystemAttribute'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
