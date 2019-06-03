package cn.edu.cup.system

class QueryStatementA {

    String controllerName
    String actionName
    String keyString
    String formatString
    String paramsString
    String queryString
    String viewName
    boolean isSQL = false
    Date updateTime = new Date()
    boolean needToQuery = true  //是否需要执行

    static mapping = {
        sort('controllerName')
        sort('actionName')
        sort('keyString')
    }

    static constraints = {
        controllerName(nullable: false)
        actionName(nullable: false)
        keyString(nullable: false)
        formatString(nullable: true)
        paramsString(nullable: true)
        queryString(nullable: true, size: 0..1024)
        viewName(nullable: true)
        isSQL()
        updateTime()
        needToQuery()
    }

    String toString() {
        return "${controllerName}.${actionName}.${keyString}"
    }
}
