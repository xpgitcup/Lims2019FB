bootStrapPaginationSetting.identifier = "GroupInfo"
bootStrapPaginationSetting.controller = "operation4Organization"

var tabs课题组维护Div;

$(function () {
    console.info(document.title + "加载了...")

    tabs课题组维护Div = $("#tabs课题组维护Div");
    setupTabsBootStrap(tabs课题组维护Div);

    var filter = readStorage("filter" + document.title, "false");
    $("#currentFilter").html("当前：" + filter);
    if (filter!="false") {
        var keyString = readStorage("keyString" + document.title, "");
        $("#currentFilter课题组维护").html(keyString)
    } else {
        $("#currentFilter课题组维护").html("")
    }
})


/*
* 生成附加参数---却根据需要调整代码
* */
function appendParamsBootStrap(title) {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    var append = ""
    var filter = readStorage("filter" + document.title, "false");
    var keyString = readStorage("keyString" + document.title, "");
    $("#currentFilter课题组维护").html(keyString)
    switch (filter) {
        case "教师":
            switch (title) {
                case "教师":
                    append = "&like=" + keyString;
                    break
                case "课题组":
                    append = "&leader=" + keyString;
                    break
                case "课题组成员列表":
                    append = "&leader=" + keyString;
                    break
            }
            break
        case "课题组":
            switch (title) {
                case "教师":
                    append = "&leader=" + keyString;
                    break
                case "课题组":
                    append = "&like=" + keyString;
                    break
                case "课题组成员列表":
                    append = "&like=" + keyString;
                    break
            }
            break
        default:
            break;
    }

    return append;
}

function selectCurrentItem(id) {
    var title = getCurrentTabTitle(tabs课题组维护Div);
    sessionStorage.setItem("filter" + document.title, title);
    $("#currentFilter").html("当前：" + title);
    sessionStorage.setItem("keyString" + document.title, id);
    switch (title) {
        case "教师":
            selectTabByTitle("课题组")
            break
    }
}

function showDetail(id) {
    var url="operation4Organization/showDetail"
    ajaxRun(url, id, "display课题组成员列表Div");
}