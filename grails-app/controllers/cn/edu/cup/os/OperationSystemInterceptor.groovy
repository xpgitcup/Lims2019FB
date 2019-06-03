package cn.edu.cup.os


class OperationSystemInterceptor {

    def systemCommonService

    def OperationSystemInterceptor() {
        def rootURI = "Lims2019EB"
        def m = matchAll().excludes(controller: "home")
                .excludes(controller: "systemStatus")
                .excludes(controller: "systemStatusItem")
                .excludes(uri: "/${rootURI}/")  //这一句是关键。发布后显示主页的关键
                .excludes(uri: "/")            //开发期间显示主页
                .excludes(controller: "favicon")
        //println("拦截器：${m}")
    }

    boolean before() {
        println("${controllerName}，动作：${actionName}.之前...")
        if (!session.systemUser) {
            //println("跳转...")
            redirect(controller: "home", action: "loginUI")
        } else {
            //systemCommonService.updateSystemUserList(request)
            if (params.size() > 0) {
                //println("记录日志...") -- 放在这是可以的
                systemCommonService.updateSystemStatus(request, params)
            }
        }
        //继续执行原来的命令
        true
    }

    boolean after() {
        //println("控制器：${controllerName}，动作：${actionName}.之后...")
        //if (session.systemUser) {
        //    if (params.size()>0) {
        //println("记录日志...") -- 放在这会造成事务处理的冲突！！！
        //systemCommonService.updateSystemStatus(request, params)
        //    }
        //}
        true
    }

    void afterView() {
        // no-op
    }
}
