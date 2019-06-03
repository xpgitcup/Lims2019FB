package cn.edu.cup.common

import cn.edu.cup.system.QueryStatement
import grails.gorm.transactions.Transactional
import groovy.sql.GroovyRowResult
import groovy.sql.Sql

class CommonQueryService {

    def queryStatementService
    def dataSource

    def listFunction(params) {
        def result = [:]
        def keyString = generateKeyString(params)
        println("listFunction: ${keyString} ${params}")
        def objectList
        result.view = "default"
        def queryStatement = QueryStatement.findByKeyString(keyString)
        if (queryStatement) {
            if (queryStatement.viewName) {
                //视图
                result.view = queryStatement.viewName
            }
            if (queryStatement.needToQuery) {
                def ps = processParameters(queryStatement, params)
                if (queryStatement.hql) {
                    if (queryStatement.isSQL) {
                        objectList = processParameters4SQL(queryStatement, ps)
                    } else {
                        objectList = processParameters4HQL(queryStatement, ps)
                    }
                    result.objectList = objectList
                } else {
                    result.message = "请完善list查询.--${keyString}"
                }
            }
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
            result.message = "创建新的list查询.--${keyString}"
        }
        return result
    }

    private List<GroovyRowResult> processParameters4SQL(QueryStatement queryStatement, ps) {
        def objectList
        def db = new Sql(dataSource)
        println("执行SQL ${queryStatement.hql} 参数：${ps}")
        // 处理分页
        def sql = queryStatement.hql
        if (sql.contains('limit')) {
            println("开始处理分页参数:")
            sql = String.format(queryStatement.hql, Integer.parseInt(ps.offset), Integer.parseInt(ps.max))
            ps.remove("offset")
            ps.remove("max")
            println("植入分页控制：${sql}")
        }
        // 剔除分页控制后
        if (ps.size() > 0) {
            //objectList = db.rows(ps, sql)
            def realSql
            ps.keySet().each { e ->
                def v = "${ps.get(e)}"
                println("植入参数：${e} ${v}")
                v = v.replace("[","")
                v = v.replace("]","")
                realSql = sql.replaceAll(e, v)
                sql = realSql
            }
            println("植入参数后最终结果：${sql}")
            objectList = db.rows(sql)//, ps)
        } else {
            objectList = db.rows(sql)
        }
        println("列表SQL: ${objectList}")
        objectList
    }

    private List processParameters4HQL(QueryStatement queryStatement, ps) {
        def objectList
        def hql = processLikeParameter(queryStatement, ps)
        objectList = QueryStatement.executeQuery(hql, ps)
        objectList
    }

    private LinkedHashMap<Object, Object> processParameters(QueryStatement queryStatement, params) {
        def pl = []
        println("${queryStatement.hql}")
        //参数处理
        if (queryStatement.paramsList) {
            pl.addAll(queryStatement.paramsList.split(","))
        }
        def ps = [:]
        ps.offset = params.offset
        ps.max = params.max
        pl.each { e ->
            ps.put(e, params.get(e))
        }
        println("list 参数：${ps}")
        println("HQL: ${queryStatement.hql}, ${ps}")
        ps
    }

    private processLikeParameter(QueryStatement queryStatement, LinkedHashMap ps) {
        def temp = queryStatement.hql
        if (queryStatement.hql.contains("like")) {
            def keyStringA = "\'%${ps.keyString}%\'"
            ps.remove("keyString")
            temp = queryStatement.hql.replace(":keyString", keyStringA)
            println("处理like: ${temp}")
        }
        return temp
    }


    Object countFunction(params) {
        def keyString = generateKeyString(params)
        def count = -1
        def pl = []
        //查询SQL语句
        def queryStatement = QueryStatement.findByKeyString(keyString)
        if (queryStatement) {
            if (queryStatement.needToQuery) {
                println("统计语句； ${queryStatement.hql}")
                if (queryStatement.hql) {
                    def ps = processParameters(queryStatement, params)
                    //println("count 参数：${ps}")
                    // 区分HQL以及SQL
                    if (queryStatement.isSQL) {
                        def c = processParameters4SQL(queryStatement, ps)
                        println("统计SQL的结果 ${c}")
                        count = [c[0].values()[0]]
                        println("SQL 执行结果：${count}")
                    } else {
                        def hql = processLikeParameter(queryStatement, ps)
                        count = QueryStatement.executeQuery(hql, ps)
                    }
                }
            }
        } else {
            def nq = new QueryStatement(keyString: keyString);
            queryStatementService.save(nq)
        }
        return count
    }

    private def generateKeyString(params) {
        //println("内部：${params}")
        def keyString = ""
        def exclude = ["offset", "max", "id", "format"] // 参数中不包含的，一律忽略
        def include = ["controller", "action", "key"]   // 参数中包含的，只包含值--将参数值包含其中
        params.keySet().sort().each { e ->
            if (!exclude.contains(e)) {
                if (include.contains(e)) {
                    // 包含的，将关键字的值，列入其中
                    if (keyString.isEmpty()) {
                        keyString += "${params.get(e)}"
                    } else {
                        keyString += ".${params.get(e)}"
                    }
                } else {
                    // 将关键字列入其中
                    if (keyString.isEmpty()) {
                        keyString += "${e}"
                    } else {
                        keyString += ".${e}"
                    }
                }
            }
        }
        println("Query ${keyString}")
        keyString
    }

}
