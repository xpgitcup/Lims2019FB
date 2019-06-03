package cn.edu.cup.basic

import cn.edu.cup.common.DataExchangeInterface
import cn.edu.cup.common.SelfCheck

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
}
