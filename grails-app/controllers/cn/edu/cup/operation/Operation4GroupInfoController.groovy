package cn.edu.cup.operation

import cn.edu.cup.basic.GroupInfoController
import cn.edu.cup.basic.Person

class Operation4GroupInfoController extends GroupInfoController {

    def showDetail() {
        println("${params}")
        def groupInfo = groupInfoService.get(params.id)
        println("${groupInfo}")
        if (request.xhr) {
            render(template: "listMembers", model: [groupInfo: groupInfo])
        } else {
            model: [groupInfo: groupInfo]
        }
    }

    /*
     * 招聘
     * */

    def recruit() {
        def person = Person.findByName(params.name)
        if (person) {
            def group = groupInfoService.get(params.group)
            if (!group.members.contains(person)) {
                group.members.add(person)
                groupInfoService.save(group)
            } else {
                flash.message = "已经加入了!"
            }
        } else {
            flash.message = "找不到${params.name}！"
        }
        chain(action: "index")
    }

    def index() {}

}
