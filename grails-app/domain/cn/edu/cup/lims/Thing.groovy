package cn.edu.cup.lims

import cn.edu.cup.basic.Person

class Thing {

    String name
    Person sponsor
    Date startDate = new Date()
    Date endDate = new Date()

    static belongsTo = [thingType: ThingType]

    static hasMany = [contacts: Person]

    static constraints = {
        name(unique: true)
        sponsor()
        startDate(nullable: true)
        endDate(nullable: true)
    }

    String toString() {
        return "${name}"
    }

    def relatedProgress() {
        def tlist = Team.findAllByThing(this)
        def c = 0
        if (tlist.size()>0) {
            c = Progress.countByTeamInList(tlist)
        }
        return c
    }
}
