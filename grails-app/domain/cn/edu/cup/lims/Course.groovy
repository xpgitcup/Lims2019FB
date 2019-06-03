package cn.edu.cup.lims

import cn.edu.cup.basic.Teacher

import java.text.SimpleDateFormat

class Course extends Thing {

    Teacher teacher
    String schoolYear

    static constraints = {
        name()
        teacher()
        schoolYear()
        thingType()
    }

    @Override
    static List<String> dataSheetTitles() {
        def head = ["名称", "教师", "学年", "类型"]
        return head
    }

    @Override
    Map importFromDataSheet(Object dataSheet) {
        println("开始导入：${dataSheet}")
        def result = ""
        if (dataSheet.size() > 2) {
            def n = dataSheet[0]        //名称
            def tc = dataSheet[1]       //教师
            def tca = Teacher.findByName(tc)
            if (!tca) {
                result += "${tc} 找不到这个教师!"
            }

            def sy = dataSheet[2]       //学年
            def t = dataSheet[3]        //类型
            def tt = ThingType.findByName(t)
            if (!tt) {
                result += "${t} 类型找不到！ "
            }

            if (cn.edu.cup.lims.Course.findByName(n)) {
                result += "${n} 重复了！"
            } else {
                if (tt) {
                    name = n
                    teacher = tca
                    thingType = tt
                    schoolYear = sy
                } else {
                    result += "${t} 类型找不到！"
                }
            }
        } else {
            result += "列数不够！"
        }
        def model = [course: this, result: result]
        return model
    }

    @Override
    List exportToDataSheet() {
        def dataSheet = []
        dataSheet.add(name)
        dataSheet.add(companyA)
        dataSheet.add(thingType)
        dataSheet.add(startDate)
        dataSheet.add(duration)
        return dataSheet
    }

}
