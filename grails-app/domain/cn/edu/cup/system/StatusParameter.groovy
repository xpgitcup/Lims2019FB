package cn.edu.cup.system

class StatusParameter {

    String statusKey
    String statusValue

    static belongsTo = [systemStatus: SystemStatus]

    static constraints = {
        statusKey(nullable: false)
        statusValue(nullable: true, size: 0..1024)
    }

    String toString() {
        return "${statusKey}=${statusValue}"
    }
}
