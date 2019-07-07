bootStrapPaginationSetting.identifier = "GroupInfo"
bootStrapPaginationSetting.controller = "operation4GroupInfo"

var card课题组Div;

$(function () {
    console.info(document.title + "加载了...")
    card课题组Div = $("#card课题组Div");
    setupPagination4Card(card课题组Div);
    loadCurrentPageBootStrap("课题组")
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    return "";
}

/*
* 队员列表
* */
function showDetail(id) {
    var url = "operation4GroupInfo/showDetail"
    ajaxRun(url, id, "memberList");
}