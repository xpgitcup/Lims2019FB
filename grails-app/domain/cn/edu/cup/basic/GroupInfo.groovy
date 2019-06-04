package cn.edu.cup.basic

class GroupInfo {

    String name
    Person leader

    static hasMany = [members: Person]

    static constraints = {
        name()
        leader()
    }

    String toString() {
        return "${name}"
    }
}
