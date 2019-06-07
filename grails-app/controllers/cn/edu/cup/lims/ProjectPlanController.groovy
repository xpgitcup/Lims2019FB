package cn.edu.cup.lims

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ProjectPlanController extends cn.edu.cup.common.CommonController {

    ProjectPlanService projectPlanService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.projectPlanTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.projectPlanJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond projectPlanService.list(params), model:[projectPlanCount: projectPlanService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def projectPlan = projectPlanService.get(id)

        if (request.xhr) {
            render(template: view, model: [projectPlan: projectPlan])
        } else {
            respond projectPlan
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def projectPlan = new ProjectPlan(params)

        if (request.xhr) {
            render(template: view, model: [projectPlan: projectPlan])
        } else {
            respond projectPlan
        }
    }

    def save(ProjectPlan projectPlan) {

        if (projectPlan == null) {
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
            projectPlanService.save(projectPlan)
            flash.message = message(code: 'default.created.message', args: [message(code: 'projectPlan.label', default: 'ProjectPlan'), projectPlan.id])
        } catch (ValidationException e) {
            flash.message = projectPlan.errors
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

        def projectPlan = projectPlanService.get(id)

        if (request.xhr) {
            render(template: view, model: [projectPlan: projectPlan])
        } else {
            respond projectPlan
        }
    }

    def update(ProjectPlan projectPlan) {
        if (projectPlan == null) {
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
            projectPlanService.save(projectPlan)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'projectPlan.label', default: 'ProjectPlan'), projectPlan.id])
        } catch (ValidationException e) {
            flash.message = projectPlan.errors
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

        projectPlanService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'projectPlan.label', default: 'ProjectPlan'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'projectPlan.label', default: 'ProjectPlan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
