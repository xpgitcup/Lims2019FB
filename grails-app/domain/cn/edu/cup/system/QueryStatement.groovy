package cn.edu.cup.system

class QueryStatement {

    String keyString
    String hql
    boolean isSQL = false
    String viewName
    String paramsList
    boolean needToQuery = true  //是否需要执行

    static mapping = {
        hql type: 'text'
    }

    static constraints = {
        keyString(unique: true)
        hql(nullable: true, size: 0..1024)
        isSQL(nullable: true)
        viewName(nullable: true)
        paramsList(nullable: true)
        needToQuery()
    }

    String toString() {
        return "${keyString}"
    }

}
