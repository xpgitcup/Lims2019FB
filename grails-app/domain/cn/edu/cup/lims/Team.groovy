package cn.edu.cup.lims

import cn.edu.cup.basic.Person

/*
团队，队长也加入到成员中。
* */
class Team {

    Person leader
    Thing thing

    static hasMany = [members: Person, progresses: Progress]

    static constraints = {
        leader()
        thing()
    }

    static mapping = {
        sort('leader')
    }

    String toString() {
        return "${thing}.${leader}"
    }
}
