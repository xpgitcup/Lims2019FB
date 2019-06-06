package cn.edu.cup.lims

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PlanController extends cn.edu.cup.common.CommonController {

    PlanService planService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.planTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.planJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond planService.list(params), model:[planCount: planService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def plan = planService.get(id)

        if (request.xhr) {
            render(template: view, model: [plan: plan])
        } else {
            respond plan
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def plan = new Plan(params)

        if (request.xhr) {
            render(template: view, model: [plan: plan])
        } else {
            respond plan
        }
    }

    def save(Plan plan) {

        if (plan == null) {
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
            planService.save(plan)
            flash.message = message(code: 'default.created.message', args: [message(code: 'plan.label', default: 'Plan'), plan.id])
        } catch (ValidationException e) {
            flash.message = plan.errors
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

        def plan = planService.get(id)

        if (request.xhr) {
            render(template: view, model: [plan: plan])
        } else {
            respond plan
        }
    }

    def update(Plan plan) {
        if (plan == null) {
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
            planService.save(plan)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'plan.label', default: 'Plan'), plan.id])
        } catch (ValidationException e) {
            flash.message = plan.errors
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

        planService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'plan.label', default: 'Plan'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'plan.label', default: 'Plan'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
