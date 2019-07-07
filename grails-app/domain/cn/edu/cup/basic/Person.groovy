package cn.edu.cup.basic

import cn.edu.cup.common.DataExchangeInterface
import cn.edu.cup.common.SelfCheck
import cn.edu.cup.lims.Team

class Person implements SelfCheck {

    String code
    String name

    static belongsTo = [personTitle: PersonTitle]

    static constraints = {
        code(unique: true)
        name()
    }

    String toString() {
        return "${code}.${name}"
    }

    @Override
    void selfCheck() {
        def p = PersonTitle.findByName(personTitle.name)
        if (p) {
            personTitle = p
        }
    }

    /*
    自定义的一些相关查询
    * */

    static List allTeachers() {
        def pt = PersonTitle.findByName("教师")
        def pts = pt.relatedTitles()
        def ts = Person.executeQuery("from Person person where person.personTitle in (${pts})")
        return ts
    }

}
