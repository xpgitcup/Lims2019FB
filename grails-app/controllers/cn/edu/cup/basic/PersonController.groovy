package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PersonController extends cn.edu.cup.common.CommonController {

    PersonService personService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.personTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.personJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond personService.list(params), model:[personCount: personService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def person = personService.get(id)

        if (request.xhr) {
            render(template: view, model: [person: person])
        } else {
            respond person
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def person = new Person(params)

        if (request.xhr) {
            render(template: view, model: [person: person])
        } else {
            respond person
        }
    }

    def save(Person person) {

        if (person == null) {
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
            personService.save(person)
            flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), person.id])
        } catch (ValidationException e) {
            flash.message = person.errors
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

        def person = personService.get(id)

        if (request.xhr) {
            render(template: view, model: [person: person])
        } else {
            respond person
        }
    }

    def update(Person person) {
        if (person == null) {
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
            personService.save(person)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), person.id])
        } catch (ValidationException e) {
            flash.message = person.errors
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

        personService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
