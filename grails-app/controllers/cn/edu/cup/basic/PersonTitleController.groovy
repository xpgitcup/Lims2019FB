package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PersonTitleController extends cn.edu.cup.common.CommonController {

    PersonTitleService personTitleService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.personTitleTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.personTitleJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond personTitleService.list(params), model:[personTitleCount: personTitleService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def personTitle = personTitleService.get(id)

        if (request.xhr) {
            render(template: view, model: [personTitle: personTitle])
        } else {
            respond personTitle
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def personTitle = new PersonTitle(params)

        if (request.xhr) {
            render(template: view, model: [personTitle: personTitle])
        } else {
            respond personTitle
        }
    }

    def save(PersonTitle personTitle) {

        if (personTitle == null) {
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
            personTitleService.save(personTitle)
            flash.message = message(code: 'default.created.message', args: [message(code: 'personTitle.label', default: 'PersonTitle'), personTitle.id])
        } catch (ValidationException e) {
            flash.message = personTitle.errors
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

        def personTitle = personTitleService.get(id)

        if (request.xhr) {
            render(template: view, model: [personTitle: personTitle])
        } else {
            respond personTitle
        }
    }

    def update(PersonTitle personTitle) {
        if (personTitle == null) {
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
            personTitleService.save(personTitle)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'personTitle.label', default: 'PersonTitle'), personTitle.id])
        } catch (ValidationException e) {
            flash.message = personTitle.errors
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

        personTitleService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'personTitle.label', default: 'PersonTitle'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personTitle.label', default: 'PersonTitle'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
