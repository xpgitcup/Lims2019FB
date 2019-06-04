package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TutorInfoController extends cn.edu.cup.common.CommonController {

    TutorInfoService tutorInfoService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.tutorInfoTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.tutorInfoJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond tutorInfoService.list(params), model:[tutorInfoCount: tutorInfoService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def tutorInfo = tutorInfoService.get(id)

        if (request.xhr) {
            render(template: view, model: [tutorInfo: tutorInfo])
        } else {
            respond tutorInfo
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def tutorInfo = new TutorInfo(params)

        if (request.xhr) {
            render(template: view, model: [tutorInfo: tutorInfo])
        } else {
            respond tutorInfo
        }
    }

    def save(TutorInfo tutorInfo) {

        if (tutorInfo == null) {
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
            tutorInfoService.save(tutorInfo)
            flash.message = message(code: 'default.created.message', args: [message(code: 'tutorInfo.label', default: 'TutorInfo'), tutorInfo.id])
        } catch (ValidationException e) {
            flash.message = tutorInfo.errors
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

        def tutorInfo = tutorInfoService.get(id)

        if (request.xhr) {
            render(template: view, model: [tutorInfo: tutorInfo])
        } else {
            respond tutorInfo
        }
    }

    def update(TutorInfo tutorInfo) {
        if (tutorInfo == null) {
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
            tutorInfoService.save(tutorInfo)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'tutorInfo.label', default: 'TutorInfo'), tutorInfo.id])
        } catch (ValidationException e) {
            flash.message = tutorInfo.errors
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

        tutorInfoService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'tutorInfo.label', default: 'TutorInfo'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tutorInfo.label', default: 'TutorInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
