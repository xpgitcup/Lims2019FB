package cn.edu.cup.basic

import cn.edu.cup.system.SystemMenu

class Shortcut {

    PersonTitle personTitle
    SystemMenu systemMenu
    String iconFilename

    static constraints = {
        personTitle()
        systemMenu()
        iconFilename(nullable: true)
    }

    String toString() {
        return "${personTitle}.${systemMenu}"
    }
}
