bootStrapPaginationSetting.identifier = "Team"
bootStrapPaginationSetting.controller = "operation4StudentProject"

var tabs任务选择Div;

$(function(){
    console.info(document.title + "加载了...")
    tabs任务选择Div = $("#tabs任务选择Div");
    setupPaginationBootStrap(tabs任务选择Div);
    setupTabsBootStrap(tabs任务选择Div);
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    return "";
}
