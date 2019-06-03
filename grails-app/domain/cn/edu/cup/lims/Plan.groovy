package cn.edu.cup.lims

import cn.edu.cup.common.SelfCheck

class Plan implements SelfCheck{

    Plan upPlan
    ThingType thingType
    String description
    Date updateDate = new Date()
    Integer serialNumber = 0

    static hasMany = [subItems: Plan]

    static constraints = {
        upPlan(nullable: true)
        description()
        thingType()
        updateDate()
        serialNumber()
    }

    static mapping = {
        subItems sort: 'serialNumber'  //这是排序的标准做法
    }

    String toString() {
        return "${description}"
    }

    @Override
    void selfCheck() {
        if (subItems) {
            subItems.each { e->
                e.upPlan = this
                e.selfCheck()
            }
        }
    }
}
