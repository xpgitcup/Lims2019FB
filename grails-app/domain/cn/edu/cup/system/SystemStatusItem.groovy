package cn.edu.cup.system

class SystemStatusItem {

    Date actionTime = new Date()
    String paramsString

    static belongsTo = [systemStatus: SystemStatus]

    static constraints = {
        actionTime(nullable: true)
        paramsString(nullable: true)
    }

    String toString() {
        return "${actionTime}"
    }
}
