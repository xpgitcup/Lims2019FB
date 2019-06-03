package lims2019fb

class BootStrap {

    def initService
    def commonService

    def init = { servletContext ->
        // 这一句很关键---给公用变量赋值！！
        commonService.webRootPath = servletContext.getRealPath("/")
        environments {
            development {
                println("开发环境...")
                initService.configureForDevelopment(servletContext);
            }
            production {
                println("发布环境...")
                initService.configureForDevelopment(servletContext);
            }
        }
    }
    def destroy = {
    }
}
