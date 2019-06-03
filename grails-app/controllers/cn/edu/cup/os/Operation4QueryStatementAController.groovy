package cn.edu.cup.os

import cn.edu.cup.system.QueryStatementAController

import java.text.SimpleDateFormat

class Operation4QueryStatementAController extends QueryStatementAController {

    def backup2file() {
        def now = new Date()
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmm")
        def fileName = ">f:/LiXiaopingData/归档/02开发/实验室管理-基础数据/debug/query_statementa${df.format(now)}.sql"
        def myCommandString = ["cmd",
                               "/C",
                               "C:/Program Files/MySQL/MySQL Server 5.7/bin/mysqldump",
                               "-usample",
                               "-psample@chuyun",
                               "lims2019db",
                               "query_statementa",
                               //">f:/b.sql"
                               fileName
                               //"F:\\LiXiaopingData\\归档\\02开发\\实验室管理-基础数据\\debug\\${fileName}"
        ]
        Process proc = myCommandString.execute()
        println("备份数据库：${proc.getText()} ${fileName}")

        redirect(action: "index")
    }

    def exportToJsonFileName() {
        def now = new Date()
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH-mm")
        def fileName = "${params.fileName} ${df.format(now)}.json"
        commonService.exportObjectsToJsonFileName(queryStatementAService.list(), fileName)
        redirect(action: "index")
    }

    def index() {}
}
