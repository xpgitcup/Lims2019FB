package cn.edu.cup.basic

class Teacher extends Person {

    static constraints = {
        code()
        name()
    }

    static hasMany = [students: Student]

}
