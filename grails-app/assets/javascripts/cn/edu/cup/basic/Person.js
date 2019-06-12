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
    sessionStorage.setItem("filter" + document.title, false)
    $("#newTeacher").attr("class", "d-none")
    $("#newStudent").attr("class", "d-none")
    $("#newMaster").attr("class", "d-none")

    switch (title) {
        case "教师":
            $("#newTeacher").attr("class", "")
            break
        case "本科生":
            $("#newStudent").attr("class", "")
            break
        case "研究生":
            $("#newMaster").attr("class", "")
            break
    }
}

/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    var append = ""
    var filter = readStorage("filter" + document.title, "false");
    var keyString = readStorage("keyString" + document.title, "");
    switch (filter) {
        case "like":
            append = "&like=" + keyString;
            $("#currentFilter人员维护").html(keyString)
            break
    }
    return  append;
}

