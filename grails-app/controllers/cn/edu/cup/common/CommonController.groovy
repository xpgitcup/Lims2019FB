package cn.edu.cup.common

import cn.edu.cup.system.SystemStatus
import grails.converters.JSON

class CommonController {

    def commonQueryAService

    def list() {
        //println("原始参数：${params}")
        prepareParams()
        //println("处理后的参数：${params}")
        def result = commonQueryAService.listFunction(params)
        result = processResult(result, params)
        //println("list查询结果：${result}")
        def view = result.view
        flash.message = result.message
        if (request.xhr) {
            render(template: view, model: [objectList: result.objectList, flash: flash, result: result])
        } else {
            respond result.objectList
        }
    }

    def count() {
        prepareParams()
        def count = commonQueryAService.countFunction(params)
        def result = [count: count]

        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    protected void prepareParams() {}

    protected def processResult(result, params) {
        return result
    }

}
