package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class GradeInfoController extends cn.edu.cup.common.CommonController {

    GradeInfoService gradeInfoService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.gradeInfoTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.gradeInfoJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond gradeInfoService.list(params), model:[gradeInfoCount: gradeInfoService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def gradeInfo = gradeInfoService.get(id)

        if (request.xhr) {
            render(template: view, model: [gradeInfo: gradeInfo])
        } else {
            respond gradeInfo
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def gradeInfo = new GradeInfo(params)

        if (request.xhr) {
            render(template: view, model: [gradeInfo: gradeInfo])
        } else {
            respond gradeInfo
        }
    }

    def save(GradeInfo gradeInfo) {

        if (gradeInfo == null) {
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
            gradeInfoService.save(gradeInfo)
            flash.message = message(code: 'default.created.message', args: [message(code: 'gradeInfo.label', default: 'GradeInfo'), gradeInfo.id])
        } catch (ValidationException e) {
            flash.message = gradeInfo.errors
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

        def gradeInfo = gradeInfoService.get(id)

        if (request.xhr) {
            render(template: view, model: [gradeInfo: gradeInfo])
        } else {
            respond gradeInfo
        }
    }

    def update(GradeInfo gradeInfo) {
        if (gradeInfo == null) {
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
            gradeInfoService.save(gradeInfo)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'gradeInfo.label', default: 'GradeInfo'), gradeInfo.id])
        } catch (ValidationException e) {
            flash.message = gradeInfo.errors
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

        gradeInfoService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'gradeInfo.label', default: 'GradeInfo'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'gradeInfo.label', default: 'GradeInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
