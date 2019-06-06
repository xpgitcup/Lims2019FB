package cn.edu.cup.lims

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ProjectController extends cn.edu.cup.common.CommonController {

    ProjectService projectService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.projectTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.projectJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond projectService.list(params), model:[projectCount: projectService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def project = projectService.get(id)

        if (request.xhr) {
            render(template: view, model: [project: project])
        } else {
            respond project
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def project = new Project(params)

        if (request.xhr) {
            render(template: view, model: [project: project])
        } else {
            respond project
        }
    }

    def save(Project project) {

        if (project == null) {
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
            projectService.save(project)
            flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), project.id])
        } catch (ValidationException e) {
            flash.message = project.errors
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

        def project = projectService.get(id)

        if (request.xhr) {
            render(template: view, model: [project: project])
        } else {
            respond project
        }
    }

    def update(Project project) {
        if (project == null) {
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
            projectService.save(project)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), project.id])
        } catch (ValidationException e) {
            flash.message = project.errors
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

        projectService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
