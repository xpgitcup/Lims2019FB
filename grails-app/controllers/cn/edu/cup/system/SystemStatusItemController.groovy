package cn.edu.cup.system

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SystemStatusItemController extends cn.edu.cup.common.CommonController {

    SystemStatusItemService systemStatusItemService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.systemStatusItemTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.systemStatusItemJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond systemStatusItemService.list(params), model:[systemStatusItemCount: systemStatusItemService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def systemStatusItem = systemStatusItemService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemStatusItem: systemStatusItem])
        } else {
            respond systemStatusItem
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def systemStatusItem = new SystemStatusItem(params)

        if (request.xhr) {
            render(template: view, model: [systemStatusItem: systemStatusItem])
        } else {
            respond systemStatusItem
        }
    }

    def save(SystemStatusItem systemStatusItem) {

        if (systemStatusItem == null) {
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
            systemStatusItemService.save(systemStatusItem)
            flash.message = message(code: 'default.created.message', args: [message(code: 'systemStatusItem.label', default: 'SystemStatusItem'), systemStatusItem.id])
        } catch (ValidationException e) {
            flash.message = systemStatusItem.errors
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

        def systemStatusItem = systemStatusItemService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemStatusItem: systemStatusItem])
        } else {
            respond systemStatusItem
        }
    }

    def update(SystemStatusItem systemStatusItem) {
        if (systemStatusItem == null) {
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
            systemStatusItemService.save(systemStatusItem)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'systemStatusItem.label', default: 'SystemStatusItem'), systemStatusItem.id])
        } catch (ValidationException e) {
            flash.message = systemStatusItem.errors
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

        systemStatusItemService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemStatusItem.label', default: 'SystemStatusItem'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemStatusItem.label', default: 'SystemStatusItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
