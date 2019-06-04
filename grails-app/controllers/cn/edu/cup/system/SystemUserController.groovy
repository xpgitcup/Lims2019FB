package cn.edu.cup.system

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SystemUserController extends cn.edu.cup.common.CommonController {

    SystemUserService systemUserService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.systemUserTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.systemUserJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond systemUserService.list(params), model:[systemUserCount: systemUserService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def systemUser = systemUserService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemUser: systemUser])
        } else {
            respond systemUser
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def systemUser = new SystemUser(params)

        if (request.xhr) {
            render(template: view, model: [systemUser: systemUser])
        } else {
            respond systemUser
        }
    }

    def save(SystemUser systemUser) {

        if (systemUser == null) {
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
            systemUserService.save(systemUser)
            flash.message = message(code: 'default.created.message', args: [message(code: 'systemUser.label', default: 'SystemUser'), systemUser.id])
        } catch (ValidationException e) {
            flash.message = systemUser.errors
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

        def systemUser = systemUserService.get(id)

        if (request.xhr) {
            render(template: view, model: [systemUser: systemUser])
        } else {
            respond systemUser
        }
    }

    def update(SystemUser systemUser) {
        if (systemUser == null) {
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
            systemUserService.save(systemUser)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'systemUser.label', default: 'SystemUser'), systemUser.id])
        } catch (ValidationException e) {
            flash.message = systemUser.errors
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

        systemUserService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'systemUser.label', default: 'SystemUser'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemUser.label', default: 'SystemUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
