package cn.edu.cup.lims

import java.text.SimpleDateFormat

class Project extends Thing {

    String companyA
    Date startDate
    double duration

    static constraints = {
        name(unique: true)
        thingType()
        companyA(nullable: true)
        startDate(nullable: true)
        duration(nullable: true)
    }

}
