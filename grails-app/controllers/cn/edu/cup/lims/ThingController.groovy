package cn.edu.cup.lims

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ThingController extends cn.edu.cup.common.CommonController {

    ThingService thingService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.thingTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.thingJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond thingService.list(params), model:[thingCount: thingService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def thing = thingService.get(id)

        if (request.xhr) {
            render(template: view, model: [thing: thing])
        } else {
            respond thing
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def thing = new Thing(params)

        if (request.xhr) {
            render(template: view, model: [thing: thing])
        } else {
            respond thing
        }
    }

    def save(Thing thing) {

        if (thing == null) {
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
            thingService.save(thing)
            flash.message = message(code: 'default.created.message', args: [message(code: 'thing.label', default: 'Thing'), thing.id])
        } catch (ValidationException e) {
            flash.message = thing.errors
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

        def thing = thingService.get(id)

        if (request.xhr) {
            render(template: view, model: [thing: thing])
        } else {
            respond thing
        }
    }

    def update(Thing thing) {
        if (thing == null) {
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
            thingService.save(thing)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'thing.label', default: 'Thing'), thing.id])
        } catch (ValidationException e) {
            flash.message = thing.errors
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

        thingService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'thing.label', default: 'Thing'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'thing.label', default: 'Thing'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
