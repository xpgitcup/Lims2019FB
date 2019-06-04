package cn.edu.cup.basic

class StudentClass {

    Major major
    Integer enrollment
    PersonTitle personTitle
    String name

    static constraints = {
    }

    String toString() {
        return "${major}.${personTitle}.${enrollment}.${name}"
    }
}
