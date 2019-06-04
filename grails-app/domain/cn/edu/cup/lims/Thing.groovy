package cn.edu.cup.lims

import cn.edu.cup.basic.Person

class Thing {

    String name
    Person sponsor

    static belongsTo = [thingType: ThingType]

    static hasMany = [progresses: Progress]

    static constraints = {
        name(unique: true)
        sponsor()
    }

    String toString() {
        return "${name}"
    }

}
