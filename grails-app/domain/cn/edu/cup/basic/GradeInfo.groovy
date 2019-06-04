package cn.edu.cup.basic

/*
班级信息
* */
class GradeInfo {

    String name
    Major major
    Integer enrollmentYear
    PersonTitle personTitle

    static hasMany = [students: Person]

    static constraints = {
        name()
        major()
        enrollmentYear()
    }

    String toString() {
        return "${major}.${personTitle.name}.${enrollmentYear}.${name}"
    }
}
