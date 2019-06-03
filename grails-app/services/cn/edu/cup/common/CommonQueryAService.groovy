package cn.edu.cup.common

import cn.edu.cup.system.QueryStatementA
import grails.gorm.transactions.Transactional
import groovy.sql.GroovyRowResult
import groovy.sql.Sql

@Transactional
class CommonQueryAService {

    def queryStatementAService
    def dataSource

    /*
    列表查询功能
    * */

    def listFunction(params) {
        def (QueryStatementA queryStatement, leftParams) = findOrCreateQueryString(params)
        // 开始执行查询
        def result = [:]
        def objectList = []
        // 设置缺省参数
        result.view = "default"
        result.objectList = objectList
        if (queryStatement) {
            // 处理视图
            if (queryStatement.viewName) {
                result.view = queryStatement.viewName
            }
            if (queryStatement.needToQuery) {
                if (queryStatement.queryString) {
                    // 执行查询
                    def queryString = queryStatement.queryString
                    println("列表查询：${queryString}")
                    if (queryStatement.isSQL) {
                        objectList = processParameters4SQL(queryString, leftParams)
                    } else {
                        (queryString, leftParams) = processSpecailParameter(queryString, leftParams)
                        objectList = QueryStatementA.executeQuery(queryString, leftParams)
                    }
                    result.objectList = objectList
                    println("查询结果：${objectList}")
                }
            }
        }
        return result
    }

    /*
    统计功能
    * */

    def countFunction(params) {
        def count = 1
        def (QueryStatementA queryStatement, leftParams) = findOrCreateQueryString(params)
        // 开始执行查询
        if (queryStatement) {
            if (queryStatement.needToQuery) {
                if (queryStatement.queryString) {
                    def queryString = queryStatement.queryString
                    println("统计语句：${queryString}")
                    if (queryStatement.isSQL) {
                        def c = processParameters4SQL(queryString, leftParams)
                        count = [c[0].values()[0]]
                    } else {
                        (queryString, leftParams) = processSpecailParameter(queryString, leftParams)
                        count = QueryStatementA.executeQuery(queryString, leftParams)
                    }
                }
            }
        }
        return count
    }

    /*
    找到或者创建查询语句
    * */

    private List findOrCreateQueryString(params) {
        def (controllerName,
             actionName,
             paramsString,
             formatString,
             keyString,
             leftParams
        ) = genericKey(params)

        println("查询参数：${paramsString}")
        def queryStatement =
                QueryStatementA.findByControllerNameAndActionNameAndKeyStringAndParamsString(
                        controllerName, actionName, keyString, paramsString)
        if (!queryStatement) {
            queryStatement = new QueryStatementA(
                    controllerName: controllerName,
                    actionName: actionName,
                    keyString: keyString,
                    formatString: formatString,
                    paramsString: paramsString
            )
            queryStatementAService.save(queryStatement)
            println("创建查询：${queryStatement}")
        }
        println("参数值：${leftParams}")
        [queryStatement, leftParams]
    }

    /*
    处理参数，先找到查询语句的关键字，形成用于查询的参数列表
    * */

    private List genericKey(params) {
        def controllerName = params.controller
        def actionName = params.action
        def formatString = params.format
        def keyString = params.key
        def paramsString

        def tmpps = [:]
        tmpps.putAll(params)
        def unUsed = ["controller", "action", "format", "key", "id"]
        unUsed.each { e ->
            tmpps.remove(e)
        }
        def pk = tmpps.keySet().sort()
        paramsString = "${pk}"
        [controllerName, actionName, paramsString, formatString, keyString, tmpps]
    }

    /*
    处理特殊参数
    * */

    def processSpecailParameter(queryString, Map leftParams) {
        def nq = queryString
        if (leftParams.containsKey("like")) {
            def value = leftParams.get("like")
            def likeValue = "'%${value}%'"
            nq = queryString.replace(":like", likeValue)
            leftParams.remove("like")
        }
        return [nq, leftParams]
    }

    /*
    为SQL处理参数
    * */

    List<GroovyRowResult> processParameters4SQL(queryString, Map leftParams) {
        def objectList
        def db = new Sql(dataSource)
        println("执行SQL ${queryString} 参数：${leftParams}")
        // 处理分页
        if (queryString.contains('limit')) {
            println("开始处理分页参数:")
            queryString = String.format(queryString, Integer.parseInt(leftParams.offset), Integer.parseInt(leftParams.max))
            leftParams.remove("offset")
            leftParams.remove("max")
            println("植入分页控制：${queryString}")
        }
        // 剔除分页控制后
        if (leftParams.size() > 0) {
            //objectList = db.rows(ps, sql)
            def realSql
            leftParams.keySet().each { e ->
                def v = "${leftParams.get(e)}"
                println("植入参数：${e} ${v}")
                v = v.replace("[", "")
                v = v.replace("]", "")
                realSql = queryString.replaceAll(e, v)
                queryString = realSql
            }
            println("植入参数后最终结果：${queryString}")
            objectList = db.rows(queryString)//, ps)
        } else {
            objectList = db.rows(queryString)
        }
        println("列表SQL: ${objectList}")
        objectList
    }

}
