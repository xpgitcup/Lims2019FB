package cn.edu.cup.system

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SystemMenuController extends cn.edu.cup.common.CommonController {

    SystemMenuService systemMenuService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.systemMenuTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.systemMenuJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond systemMenuService.list(params), model:[systemMenuCount: systemMenuService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def systemMenu = systemMenuService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemMenu: systemMenu])
        } else {
            respond systemMenu
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def systemMenu = new SystemMenu(params)

        if (request.xhr) {
            render(template: view, model: [systemMenu: systemMenu])
        } else {
            respond systemMenu
        }
    }

    def save(SystemMenu systemMenu) {

        if (systemMenu == null) {
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
            systemMenuService.save(systemMenu)
            flash.message = message(code: 'default.created.message', args: [message(code: 'systemMenu.label', default: 'SystemMenu'), systemMenu.id])
        } catch (ValidationException e) {
            flash.message = systemMenu.errors
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

        def systemMenu = systemMenuService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemMenu: systemMenu])
        } else {
            respond systemMenu
        }
    }

    def update(SystemMenu systemMenu) {
        if (systemMenu == null) {
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
            systemMenuService.save(systemMenu)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'systemMenu.label', default: 'SystemMenu'), systemMenu.id])
        } catch (ValidationException e) {
            flash.message = systemMenu.errors
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

        systemMenuService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemMenu.label', default: 'SystemMenu'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemMenu.label', default: 'SystemMenu'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
