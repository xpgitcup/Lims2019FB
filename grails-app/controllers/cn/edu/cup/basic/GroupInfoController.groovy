package cn.edu.cup.basic

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class GroupInfoController extends cn.edu.cup.common.CommonController {

    GroupInfoService groupInfoService
    def commonService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        def model = [:]
        def userResult = false
        params.max = Math.min(max ?: 10, 100)
        if (params.title) {
            model.groupInfoTitle = params.title
            userResult = true
        }
        if (params.jsRoutine) {
            model.groupInfoJsRoutine = params.jsRoutine
            userResult = true
        }

        if (userResult) {
            model
        } else {
            respond groupInfoService.list(params), model:[groupInfoCount: groupInfoService.count()]
        }
    }

    def show(Long id) {
        def view = "show"
        if (params.view) {
            view = params.view
        }

        def groupInfo = groupInfoService.get(id)

        if (request.xhr) {
            render(template: view, model: [groupInfo: groupInfo])
        } else {
            respond groupInfo
        }
    }

    def create() {
        def view = "create"
        if (params.view) {
            view = params.view
        }

        def groupInfo = new GroupInfo(params)

        if (request.xhr) {
            render(template: view, model: [groupInfo: groupInfo])
        } else {
            respond groupInfo
        }
    }

    def save(GroupInfo groupInfo) {

        if (groupInfo == null) {
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
            groupInfoService.save(groupInfo)
            flash.message = message(code: 'default.created.message', args: [message(code: 'groupInfo.label', default: 'GroupInfo'), groupInfo.id])
        } catch (ValidationException e) {
            flash.message = groupInfo.errors
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

        def groupInfo = groupInfoService.get(id)

        if (request.xhr) {
            render(template: view, model: [groupInfo: groupInfo])
        } else {
            respond groupInfo
        }
    }

    def update(GroupInfo groupInfo) {
        if (groupInfo == null) {
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
            groupInfoService.save(groupInfo)
            flash.message = message(code: 'default.updated.message', args: [message(code: 'groupInfo.label', default: 'GroupInfo'), groupInfo.id])
        } catch (ValidationException e) {
            flash.message = groupInfo.errors
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

        groupInfoService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupInfo.label', default: 'GroupInfo'), id])

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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupInfo.label', default: 'GroupInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
