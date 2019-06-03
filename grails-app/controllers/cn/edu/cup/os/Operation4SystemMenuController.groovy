package cn.edu.cup.os

import cn.edu.cup.system.JsFrame
import cn.edu.cup.system.SystemMenu
import cn.edu.cup.system.SystemMenuController
import grails.converters.JSON

class Operation4SystemMenuController extends SystemMenuController {

    def treeViewService

    def exportToJsonFileName() {
        //commonService.exportObjectsToJsonFileName(SystemMenu.findAllByUpMenuItemIsNull(), params.fileName)
        commonService.exportObjectsToJsonFileName(systemMenuService.list(fetch:[upMenuItem: null]), params.fileName)
        redirect(action: "index")
    }

    /*
    * 创建对象
    * */

    def createSystemMenu(SystemMenu systemMenu) {
        def newSystemMenu = new SystemMenu(upMenuItem: systemMenu)
        if (request.xhr) {
            render(template: 'create', model: [systemMenu: newSystemMenu])
        } else {
            respond newSystemMenu
        }
    }

    /*
    * 获取当前id对应的对象
    * */

    def getSystemMenu(SystemMenu systemMenu) {
        def theModel = [systemMenu: systemMenu]
        if (request.xhr) {
            render(template: "showSystemMenu", model: theModel)
        } else {
            theModel
        }
    }

    /*
    * 获取json格式的树形结构数据
    * */

    def getTreeViewData() {
        def data = SystemMenu.findAllByUpMenuItemIsNull(params)     //这是必须调整的
        params.context = "menuContext"
        params.subItems = "menuItems"
        params.attributes = "id"    //
        def treeData = treeViewService.generateNodesString(data, params, JsFrame.BaiduECharts)
        // echarts-的树要作如下处理
        def result = [:]
        result.put("name", "系统菜单")
        result.put("children", treeData)
        if (request.xhr) {
            render result as JSON
        } else {
            result
        }
    }

    def index() {}
}
