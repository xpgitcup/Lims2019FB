package cn.edu.cup.lims

import cn.edu.cup.basic.Person

class Thing {

    String name
    Person sponsor
    Date startDate = new Date()
    double duration

    static belongsTo = [thingType: ThingType]

    static hasMany = [progresses: Progress]

    static constraints = {
        name(unique: true)
        sponsor()
        startDate(nullable: true)
        duration(nullable: true)
    }

    String toString() {
        return "${name}"
    }

}
