package cn.edu.cup.lims

import java.text.SimpleDateFormat

class Project extends Thing {

    String companyA
    Date startDate
    double duration

    static constraints = {
        name(unique: true)
        thingType()
        companyA(nullable: true)
        startDate(nullable: true)
        duration(nullable: true)
    }

    @Override
    static List<String> dataSheetTitles() {
        def head = ["名称", "甲方公司", "项目类型", "起始时间", "持续时长(年)"]
        return head
    }

    @Override
    Map importFromDataSheet(Object dataSheet) {
        println("开始导入：${dataSheet}")
        def result = ""
        if (dataSheet.size() > 2) {
            def n = dataSheet[0]    //名称
            def c = dataSheet[1]    //甲方公司
            def t = dataSheet[2]    //项目类型
            def tt = ThingType.findByName(t)
            def stDate
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                //stDate = sdf.parse(dataSheet[3])
                stDate = Date.parse("yy-MM-dd", dataSheet[3])
            } catch (Exception e) {
                result += "时间 ${dataSheet[3]} 格式不对。"
            }
            def du = Double.parseDouble(dataSheet[4])
            if (cn.edu.cup.lims.Project.findByName(n)) {
                result += "${n} 重复了！"
            } else {
                if (tt) {
                    name = n
                    companyA = c
                    thingType = tt
                    startDate = stDate
                    duration = du
                } else {
                    result += "${t} 类型找不到！"
                }
            }
        } else {
            result += "列数不够！"
        }
        def model = [project: this, result: result]
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
