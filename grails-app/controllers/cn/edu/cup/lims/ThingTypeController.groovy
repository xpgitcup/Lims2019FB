package cn.edu.cup.lims

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ThingTypeController extends cn.edu.cup.common.CommonController {

    ThingTypeService thingTypeService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.thingTypeTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.thingTypeJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond thingTypeService.list(params), model:[thingTypeCount: thingTypeService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def thingType = thingTypeService.get(id)

        if (request.xhr) {
            render(template: view, model: [thingType: thingType])
        } else {
            respond thingType
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def thingType = new ThingType(params)

        if (request.xhr) {
            render(template: view, model: [thingType: thingType])
        } else {
            respond thingType
        }
    }

    def save(ThingType thingType) {

        if (thingType == null) {
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
            thingTypeService.save(thingType)
            flash.message = message(code: 'default.created.message', args: [message(code: 'thingType.label', default: 'ThingType'), thingType.id])
        } catch (ValidationException e) {
            flash.message = thingType.errors
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

        def thingType = thingTypeService.get(id)

        if (request.xhr) {
            render(template: view, model: [thingType: thingType])
        } else {
            respond thingType
        }
    }

    def update(ThingType thingType) {
        if (thingType == null) {
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
            thingTypeService.save(thingType)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'thingType.label', default: 'ThingType'), thingType.id])
        } catch (ValidationException e) {
            flash.message = thingType.errors
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

        thingTypeService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'thingType.label', default: 'ThingType'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'thingType.label', default: 'ThingType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
