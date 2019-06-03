package cn.edu.cup.system

import cn.edu.cup.common.SelfCheck

/*
* 重新定义属性，以树形结构来维护
* */
class SystemAttribute implements SelfCheck{

    String name
    SystemAttribute upAttribute

    static hasMany = [subAttribues: SystemAttribute]

    static mapping = {
        name(sort: "asc")
        subAttribues sort: 'name'  //这是排序的标准做法
    }

    static constraints = {
        name(nullable: false, unique: false)
        upAttribute(nullable: true)
    }

    String toString() {
        return "${name}(${subAttribues?.size()})"
    }

    String[] roles() {
        def roleList = []
        subAttribues.each { e->
            roleList.add(e.name)
        }
        return roleList
    }

    @Override
    void selfCheck() {
        if (subAttribues) {
            subAttribues.each { e->
                e.upAttribute = this
                e.selfCheck()
            }
        }
    }
}
