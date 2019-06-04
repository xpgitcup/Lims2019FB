package cn.edu.cup.basic

import cn.edu.cup.system.SystemMenu

class Shortcut {

    PersonTitle personTitle
    SystemMenu systemMenu
    String iconFilename

    static constraints = {
    }

    String toString() {
        return "${personTitle}.${systemMenu}"
    }
}
