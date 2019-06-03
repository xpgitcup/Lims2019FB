package cn.edu.cup.system

import cn.edu.cup.common.SelfCheck

class SystemMenu implements SelfCheck {

    String menuContext = "缺省值"
    String menuAction
    String menuDescription
    SystemMenu upMenuItem
    String roleAttribute
    String layout
    int menuOrder = 0

    static hasMany = [menuItems: SystemMenu]

    static constraints = {
        menuContext()
        menuAction()
        menuDescription()
        menuOrder()
        upMenuItem(nullable: true)
        roleAttribute(nullable: true)
        layout(nullable: true)
    }

    static mapping = {
        sort('menuOrder')
        sort('id', 'desc')
        menuItems sort: 'menuOrder', 'id'  //这是排序的标准做法 
    }

    def beforeInsert() {
    }

    String toString() {
        return "${menuContext}()"
    }

    //------------------------------------------------------------------------------------------------------------------
    def menuPath() {
        def ps = []
        ps.add(this)
        def up = this.upMenuItem
        while (up) {
            ps.add(up)
            up = up.upMenuItem
        }
        def pps = ps.reverse()
        return pps
    }

    String hrefContext() {
        //return "<a href=\'/${menuAction}\'>${menuContext}</a>"      //这是绝对路径
        return "<a href=\'${menuAction}\'>${menuContext}</a>"      //这是相对路径
    }

    String menuItemRole() {
        def role = roleAttribute
        if ((role == null) && (this.upMenuItem != null)) {
            def parentMenu = this.upMenuItem
            while ((role == null) && (parentMenu != null)) {
                role = parentMenu.roleAttribute
                parentMenu = parentMenu.upMenuItem
            }
        }
        return role
    }

    @Override
    void selfCheck() {
        if (menuItems) {
            menuItems.each { e->
                e.upMenuItem = this
                e.selfCheck()
            }
        }
    }
}
