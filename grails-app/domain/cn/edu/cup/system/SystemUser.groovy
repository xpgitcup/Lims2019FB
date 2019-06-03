package cn.edu.cup.system

import cn.edu.cup.basic.Person

class SystemUser {
    
    String  userName
    String  password
    SystemAttribute roleAttribute
    String  appendAttribute = ""

    static mapping = {
    }
    
    static constraints = {
        userName(unique:true)
        password(password:true)
        roleAttribute(nullable: true)
        appendAttribute(nullable: true)
    }
 
    def beforeInsert() {
        //println("insert  -- ${password}")
        password = password.encodeAsMD5()
        //println "before Insert ${password}"
    }
    
    def beforeUpdate() {
        //如果密码有更新，就重新计算
        //println("update -- ${password}")
        if (isDirty('password')) {
            password = password.encodeAsMD5()
        }
        //println "before Update ${this.password}"
    }
    
    String toString() {
        return "${userName}"
    }

    //------------------------------------------------------------------------------------------------------------------
    def userRoles() {
        return roleAttribute.roles()
    }

    def hasRole (roleName) {
        def roles = userRoles()
        return roles.contains(roleName)
    }

    def person() {
        def p = Person.findByCode(userName)
        if (p) {
            return p
        } else {
            return null
        }
    }

    def personName() {
        def p = Person.findByCode(userName)
        if (p) {
            return p.name
        } else {
            return "佚名"
        }
    }

    def personTitle() {
        def p = Person.findByCode(userName)
        if (p) {
            return p.personTitle
        } else {
            return null
        }
    }
}
