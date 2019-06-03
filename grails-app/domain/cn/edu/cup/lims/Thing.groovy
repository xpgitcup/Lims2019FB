package cn.edu.cup.lims

import cn.edu.cup.common.DataExchangeInterface

class Thing implements DataExchangeInterface{

    String name

    static belongsTo = [thingType: ThingType]

    static hasMany = [progresses: Progress]

    static constraints = {
        name(unique: true)
    }

    String toString() {
        return "${name}"
    }

    @Override
    List<String> dataSheetTitles() {
        return null
    }

    @Override
    Map importFromDataSheet(Object dataSheet) {
        return null
    }

    @Override
    List exportToDataSheet() {
        return null
    }
}
