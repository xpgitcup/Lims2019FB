bootStrapPaginationSetting.identifier = "ProjectPlan"
bootStrapPaginationSetting.controller = "operation4ProjectPlan"

var card团队计划维护Div;

$(function(){
    console.info(document.title + "加载了...")
    card团队计划维护Div = $("#card团队计划维护Div");
    setupPagination4Card(card团队计划维护Div);
    loadCurrentPageBootStrap("团队计划维护")
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    return "";
}