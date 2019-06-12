bootStrapPaginationSetting.identifier = "GroupInfo"
bootStrapPaginationSetting.controller = "operation4Organization"

var tabs课题组维护Div;

$(function () {
    console.info(document.title + "加载了...")
    tabs课题组维护Div = $("#tabs课题组维护Div");
    setupTabsBootStrap(tabs课题组维护Div);

    var filter = readStorage("filter" + document.title, "false");
    $("#currentFilter").html("当前：" + filter);
})


/*
* 生成附加参数---却根据需要调整代码
* */
function appendParamsBootStrap(title) {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    var append = ""
    var filter = readStorage("filter" + document.title, "false");
    var keyString = readStorage("keyString" + document.title, "");
    switch (filter) {
        case "like":
            append = "&like=" + keyString;
            $("#currentFilter课题组维护").html(keyString)
            break
        case "教师":
            switch (title) {
                case "课题组":
                    var currentTeacher = readStorage("currentKey" + "教师", 0);
                    append = "&currentTeacher=" + currentTeacher;
                    break
            }
            break
        case "课题组":
            break
    }

    return append;
}

function selectCurrentItem(id) {
    var title = getCurrentTabTitle(tabs课题组维护Div);
    sessionStorage.setItem("filter" + document.title, title);
    $("#currentFilter").html("当前：" + title);

    switch (title) {
        case "教师":
            sessionStorage.setItem("currentKey" + title, id);
            selectTabByTitle("课题组");
            break
        case "课题组":
            sessionStorage.setItem("keyString" + document.title, id);
            sessionStorage.setItem("filter" + document.title, "like");
            break
    }
}