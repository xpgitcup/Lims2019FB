package cn.edu.cup.basic

import cn.edu.cup.common.DataExchangeInterface

class Student extends Person {

    String gradeName            //年级
    Major major                //专业

    static belongsTo = [supervisor: Teacher]

    static constraints = {
        code()
        name()
        personTitle()
        gradeName()
        major()
        supervisor(nullable: true)
    }

}
