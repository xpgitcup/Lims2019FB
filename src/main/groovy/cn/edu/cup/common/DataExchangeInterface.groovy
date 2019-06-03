package cn.edu.cup.common

interface DataExchangeInterface {

    List<String> dataSheetTitles()
    Map importFromDataSheet(dataSheet)
    //Map importFromDataSheet(dataSheet, Boolean autoUpdateType)
    List exportToDataSheet()
}