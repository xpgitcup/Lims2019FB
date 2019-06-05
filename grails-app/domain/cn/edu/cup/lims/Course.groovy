package cn.edu.cup.lims

class Course extends Thing {

    String code
    String school_year

    static constraints = {
        name()
        code()
        school_year()
    }

    String toString() {
        return "${name}.${code}"
    }
}
