package cn.edu.cup.lims

class Course extends Thing {

    String code
    String schoolYear

    static constraints = {
        name(unique: true)
        code()
        sponsor()
        startDate(nullable: true)
        endDate(nullable: true)
        schoolYear()
    }

    String toString() {
        return "${name}.${code}"
    }
}
