package cn.edu.cup.basic

import cn.edu.cup.common.DataExchangeInterface

class Student extends Person {

    StudentClass studentClass  //年级

    static belongsTo = [supervisor: Teacher]

    static constraints = {
        code()
        name()
        personTitle()
        studentClass()
        supervisor(nullable: true)
    }

}
