package cn.edu.cup.system

class SystemStatus {

    String sessionId
    Date loginTime = new Date()
    Date logoutTime
    String userName
    String userRole
    String ip

    static hasMany = [items: SystemStatusItem, statusParameters: StatusParameter]

    static constraints = {
        sessionId()
        loginTime(nullable: true)
        logoutTime(nullable: true)
        userName(nullable: true)
        userRole(nullable: true)
        ip(nullable: true)
    }

    String toString() {
        return "${sessionId}.${items?.size()}"
    }

    def getParameters() {
        def parameters = [:]
        statusParameters.each { e->
            parameters.put(e.statusKey, e.statusValue)
        }
        return parameters
    }

}
