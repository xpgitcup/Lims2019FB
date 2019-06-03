bootStrapPaginationSetting.identifier = "Team"
bootStrapPaginationSetting.controller = "operation4TeamStudentCourse"

var tabs教学任务Div;

$(function(){
    console.info(document.title + "加载了...")
    tabs教学任务Div = $("#tabs教学任务Div");
    //setupPaginationBootStrap(tabs教学任务Div);
    setupTabsBootStrap(tabs教学任务Div);

    tabs进展情况Div = $("#tabs进展情况Div");
    //setupPaginationBootStrap(tabs进展情况Div);
    setupTabsBootStrap(tabs进展情况Div);
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    return "";
}