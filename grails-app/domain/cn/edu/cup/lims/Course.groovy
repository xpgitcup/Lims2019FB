package cn.edu.cup.lims

class Course extends Thing {

    String code
    String school_year

    static constraints = {
        name(unique: true)
        code()
        sponsor()
        startDate(nullable: true)
        endDate(nullable: true)
        school_year()
    }

    String toString() {
        return "${name}.${code}"
    }
}
