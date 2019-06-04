<%=packageName ? "package ${packageName}" : ''%>

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ${className}Controller extends cn.edu.cup.common.CommonController {

    ${className}Service ${propertyName}Service
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.${propertyName}Title = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.${propertyName}JsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond ${propertyName}Service.list(params), model:[${propertyName}Count: ${propertyName}Service.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def ${propertyName} = ${propertyName}Service.get(id)

        if (request.xhr) {
            render(template: view, model: [${propertyName}: ${propertyName}])
        } else {
            respond ${propertyName}
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def ${propertyName} = new ${className}(params)

        if (request.xhr) {
            render(template: view, model: [${propertyName}: ${propertyName}])
        } else {
            respond ${propertyName}
        }
    }

    def save(${className} ${propertyName}) {

        if (${propertyName} == null) {
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
            ${propertyName}Service.save(${propertyName})
            flash.message = message(code: 'default.created.message', args: [message(code: '${propertyName}.label', default: '${className}'), ${propertyName}.id])
        } catch (ValidationException e) {
            flash.message = ${propertyName}.errors
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

        def ${propertyName} = ${propertyName}Service.get(id)

        if (request.xhr) {
            render(template: view, model: [${propertyName}: ${propertyName}])
        } else {
            respond ${propertyName}
        }
    }

    def update(${className} ${propertyName}) {
        if (${propertyName} == null) {
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
            ${propertyName}Service.save(${propertyName})
            flash.message = message(code: 'default.updated.message', args: [message(code: '${propertyName}.label', default: '${className}'), ${propertyName}.id])
        } catch (ValidationException e) {
            flash.message = ${propertyName}.errors
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

        ${propertyName}Service.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: '${propertyName}.label', default: '${className}'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: '${propertyName}.label', default: '${className}'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
