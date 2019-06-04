package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ShortcutController extends cn.edu.cup.common.CommonController {

    ShortcutService shortcutService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.shortcutTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.shortcutJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond shortcutService.list(params), model:[shortcutCount: shortcutService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def shortcut = shortcutService.get(id)

        if (request.xhr) {
            render(template: view, model: [shortcut: shortcut])
        } else {
            respond shortcut
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def shortcut = new Shortcut(params)

        if (request.xhr) {
            render(template: view, model: [shortcut: shortcut])
        } else {
            respond shortcut
        }
    }

    def save(Shortcut shortcut) {

        if (shortcut == null) {
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
            shortcutService.save(shortcut)
            flash.message = message(code: 'default.created.message', args: [message(code: 'shortcut.label', default: 'Shortcut'), shortcut.id])
        } catch (ValidationException e) {
            flash.message = shortcut.errors
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

        def shortcut = shortcutService.get(id)

        if (request.xhr) {
            render(template: view, model: [shortcut: shortcut])
        } else {
            respond shortcut
        }
    }

    def update(Shortcut shortcut) {
        if (shortcut == null) {
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
            shortcutService.save(shortcut)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'shortcut.label', default: 'Shortcut'), shortcut.id])
        } catch (ValidationException e) {
            flash.message = shortcut.errors
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

        shortcutService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'shortcut.label', default: 'Shortcut'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'shortcut.label', default: 'Shortcut'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
