package cn.edu.cup.basic

/*
导师信息
* */
class TutorInfo {

    Person teacher

    static hasMany = [students: Person]

    static constraints = {
    }

    String toString() {
        return "${teacher}.${students?.size()}"
    }
}
