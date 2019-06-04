package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CaptionController extends cn.edu.cup.common.CommonController {

    CaptionService captionService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.captionTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.captionJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond captionService.list(params), model:[captionCount: captionService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def caption = captionService.get(id)

        if (request.xhr) {
            render(template: view, model: [caption: caption])
        } else {
            respond caption
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def caption = new Caption(params)

        if (request.xhr) {
            render(template: view, model: [caption: caption])
        } else {
            respond caption
        }
    }

    def save(Caption caption) {

        if (caption == null) {
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
            captionService.save(caption)
            flash.message = message(code: 'default.created.message', args: [message(code: 'caption.label', default: 'Caption'), caption.id])
        } catch (ValidationException e) {
            flash.message = caption.errors
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

        def caption = captionService.get(id)

        if (request.xhr) {
            render(template: view, model: [caption: caption])
        } else {
            respond caption
        }
    }

    def update(Caption caption) {
        if (caption == null) {
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
            captionService.save(caption)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'caption.label', default: 'Caption'), caption.id])
        } catch (ValidationException e) {
            flash.message = caption.errors
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

        captionService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'caption.label', default: 'Caption'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'caption.label', default: 'Caption'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
