package cn.edu.cup.lims

import cn.edu.cup.basic.PersonTitle

class ThingTypeCircle {

    ThingType thingType
    PersonTitle personTitle

    static constraints = {
        thingType()
        personTitle()
    }

    String toString() {
        return "${id}.${thingType}-${personTitle}"
    }

    /*
    所有相关的科研
    * */

    static List allRelatedProjects(PersonTitle pt) {
        def pproject = ThingType.findByName("科研项目").relatedThingTypeList();
        return getRelatedThingTypeList(pt, pproject)
    }

    private static List<Object> getRelatedThingTypeList(PersonTitle pt, pproject) {
        def list = allRelatedThingTypes(pt).unique()
        def alist = []
        list.each { e ->
            if (pproject.contains(e)) {
                alist.add(e)
            }
        }
        return alist
    }

    static List allRelatedCourses(PersonTitle pt) {
        def pproject = ThingType.findByName("教学任务").relatedThingTypeList();
        return getRelatedThingTypeList(pt, pproject)
    }

    static List allRelatedThingTypes(PersonTitle pt) {
        def list = []
        def p = pt
        while (p) {
            def ts = cn.edu.cup.lims.ThingTypeCircle.findAllByPersonTitle(p)
            ts.each { e ->
                list.addAll(e.thingType.relatedThingTypeList())
            }
            p = p.upTitle
        }
        def result = list.unique()
        return result
    }

}
