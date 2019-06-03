package cn.edu.cup.lims

import cn.edu.cup.basic.Person
import cn.edu.cup.system.DataRootPath
import org.omg.CORBA.Environment

import java.sql.Timestamp

class Progress {

    Progress prevProgress
    String currentStatus
    String problemEncounter
    String supportFileName
    Person contributor
    Date regDate = new Date()

    static belongsTo = [team: Team]

    static constraints = {
        prevProgress(nullable: true)
        currentStatus(nullable: false)
        problemEncounter(nullable: true)
        supportFileName(nullable: true)
        contributor(nullable: false)
        regDate()
    }

    String toString() {
        return "${team}.${regDate}.${currentStatus}"
    }

    Boolean checkSupportFile() {
        if (!this.supportFileName) {
            return true
        } else {
            println("当前环境 ${grails.util.Environment.current}");
            def keyString = "${grails.util.Environment.current}.operation4Progress"
            def rootPath = DataRootPath.findByKeyString(keyString).rootPath
            def fileName = "${rootPath}/documents/${this.id}/${this.supportFileName}"
            def file = new File(fileName)
            println("当前文件：${fileName} ${file.exists()}")
            return file.exists()
        }
    }

}
