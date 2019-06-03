package cn.edu.cup.common

import jxl.Sheet
import jxl.Workbook
import jxl.write.Label
import jxl.write.WritableSheet
import jxl.write.WritableWorkbook

class ExcelByJxlService {

    /*
    * excel文件导入到数组对象
    * */

    def importExcelFileToDataTable(File excelFile) {
        def dataTable = []
        if (excelFile) {
            Workbook book = Workbook.getWorkbook(excelFile)
            Sheet sheet = book.getSheet(0)
            def rowCount = sheet.getRows()
            def colCount = sheet.getColumns()
            for (int r = 0; r < rowCount; r++) {
                def item = []
                for (int c = 0; c < colCount; c++) {
                    item.add(sheet.getCell(c, r).getContents().trim())
                }
                dataTable.add(item)
            }
        }
        return dataTable
    }

    /*
    * 对象导出到excel文件
    * */

    def exportDataTable2ExcelFile(List dataTable, fileName) {
        File file = new File(fileName)
        if (file) {
            WritableWorkbook book = Workbook.createWorkbook(file)
            WritableSheet sheet = book.createSheet("sheet1", 0)

            // 先输出标题
            dataTable.eachWithIndex { e, i ->
                e.eachWithIndex { ee, j ->
                    def label = new Label(j, i, "${ee}")
                    sheet.addCell(label)
                }
            }
            book.write()
            book.close()
        }
        return fileName
    }
}

