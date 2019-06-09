bootStrapPaginationSetting.identifier = "Person"
bootStrapPaginationSetting.controller = "operation4Person"

var tabs人员维护Div;

$(function(){
    console.info(document.title + "加载了...")
    tabs人员维护Div = $("#tabs人员维护Div");
    //setupPaginationBootStrap(tabs人员维护Div);
    setupTabsBootStrap(tabs人员维护Div);
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    return "";
}

function loadDataPerson(title, currentPage) {
    var pageSize = getPageSize(title)
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParams(title)
    var url = "operation4Person/list" + pageParams + "&key=" + title + append;
    ajaxRun(url, 0, "display" + title + "Div");
}

function countDataPerson(title) {
    var url = "operation4Person/count?key=" + title;
    var total = ajaxCalculate(url);
    return total;
}

function appendParams(title) {
    return "";
}

/*
* 统计函数
* */
function countPerson(title) {
    console.info(document.title + "+统计......");
    var append = setupAppendParamsPerson();
    var url = "operation4Person/count?key=" + title + append
    console.info(document.title + " : " + url);
    var total = ajaxCalculate(url);
    return total
}

/*
* 数据加载函数
* */
function loadPerson(title, page, pageSize) {
    console.info(document.title + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var append = setupAppendParamsPerson();
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var url = "operation4Person/list" + params + "&key=" + title + append;
    console.info(document.title + " : " + url);
    ajaxRun(url, 0, "list" + title + "Div");
}

function setupAppendParamsPerson() {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    return "";
}

/*
* 定位到需要编辑的记录
* */
function listToDo() {
    console.info(jsTitlePerson + "+待完成......");
    var title = jsTitlePerson;
    var page = 1;   //每次都定位到第一页
    var params = getParams(page, localPageSizePerson);    //getParams必须是放在最最前面！！
    ajaxRun("operation4Person/list" + params + "&key=" + title + ".TODO", 0, "list" + title + "Div");
}

function shiftDisplay(title) {
    console.info("显示当前提示...")
    $("#currentTemplate").html("下载[" + title + "]模板");
    $("#currentTemplate").attr("href", "operation4Person/downloadTemplate?key=" + title);
    $("#currentImport").html("导入[" + title + "]数据");
    $("#importKey").attr("value", title);
    $("#imputManual").html("手输[" + title + "]");
    switch (title) {
        case "教师":
            //$("#inputTeacher").style.display = "block";
            //$("#inputTeacher").className = ""; //不起作用
            $("#inputTeacher").attr("class", "")
            $("#inputStudent").attr("class", "hidden")
            console.info("----显示" + title);
            break
        case "学生":
            $("#inputTeacher").attr("class", "hidden")
            $("#inputStudent").attr("class", "")
            break
        default:
            $("#inputTeacher").attr("class", "hidden")
            $("#inputStudent").attr("class", "hidden")
    }
}

