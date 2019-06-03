package cn.edu.cup.basic

class Caption {

    String name
    String logo
    String title
    String description
    String href
    String layout

    static constraints = {
        name(unique: true)
        logo(nullable: true)
        title()
        description(nullable: true)
        href(nullable: true)
        layout(nullable: true)
    }

    String toString() {
        return "${name}"
    }

}
