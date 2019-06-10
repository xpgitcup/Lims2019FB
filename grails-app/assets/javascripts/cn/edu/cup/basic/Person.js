bootStrapPaginationSetting.identifier = "Person";
bootStrapPaginationSetting.controller = "operation4Person";
bootStrapPaginationSetting.onTabShift = shiftDisplay;

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
    switch (title) {
        case "教师":
        case "学生":
            $("#newPerson").attr("class", "")
            break
        default:
            $("#newPerson").attr("class", "d-none")
    }
}

