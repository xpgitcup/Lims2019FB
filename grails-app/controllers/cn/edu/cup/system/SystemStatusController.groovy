package cn.edu.cup.system

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SystemStatusController extends cn.edu.cup.common.CommonController {

    SystemStatusService systemStatusService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.systemStatusTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.systemStatusJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond systemStatusService.list(params), model:[systemStatusCount: systemStatusService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def systemStatus = systemStatusService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemStatus: systemStatus])
        } else {
            respond systemStatus
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def systemStatus = new SystemStatus(params)

        if (request.xhr) {
            render(template: view, model: [systemStatus: systemStatus])
        } else {
            respond systemStatus
        }
    }

    def save(SystemStatus systemStatus) {

        if (systemStatus == null) {
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
            systemStatusService.save(systemStatus)
            flash.message = message(code: 'default.created.message', args: [message(code: 'systemStatus.label', default: 'SystemStatus'), systemStatus.id])
        } catch (ValidationException e) {
            flash.message = systemStatus.errors
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

        def systemStatus = systemStatusService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemStatus: systemStatus])
        } else {
            respond systemStatus
        }
    }

    def update(SystemStatus systemStatus) {
        if (systemStatus == null) {
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
            systemStatusService.save(systemStatus)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'systemStatus.label', default: 'SystemStatus'), systemStatus.id])
        } catch (ValidationException e) {
            flash.message = systemStatus.errors
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

        systemStatusService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemStatus.label', default: 'SystemStatus'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemStatus.label', default: 'SystemStatus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
