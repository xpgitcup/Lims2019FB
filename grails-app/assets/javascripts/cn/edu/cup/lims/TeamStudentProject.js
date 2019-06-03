bootStrapPaginationSetting.identifier = "Team"
bootStrapPaginationSetting.controller = "operation4TeamStudentProject"

var tabs任务选择Div;
var tabs任务进展Div;

$(function(){
    console.info(document.title + "加载了...")
    tabs任务选择Div = $("#tabs任务选择Div");
    //setupPaginationBootStrap(tabs任务选择Div);
    setupTabsBootStrap(tabs任务选择Div);

    tabs任务进展Div = $("#tabs任务进展Div");
    //setupPaginationBootStrap(tabs任务进展Div);
    setupTabsBootStrap(tabs任务进展Div);
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    return "";
}
