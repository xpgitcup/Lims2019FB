package cn.edu.cup.system

class DataRootPath {

    String keyString
    String rootPath

    static constraints = {
        keyString(unique: true)
        rootPath(nullable: false)
    }

    String toString() {
        return "${keyString}=${rootPath}"
    }
}
