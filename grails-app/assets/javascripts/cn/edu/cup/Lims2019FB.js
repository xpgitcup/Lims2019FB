bootStrapPaginationSetting.identifier = "Home"
bootStrapPaginationSetting.controller = "home"

var tabs首页内容Div;

$(function(){
    console.info(document.title + "加载了...")
    tabs首页内容Div = $("#tabs首页内容Div");
    //setupPaginationBootStrap(tabs首页内容Div);
    setupTabsBootStrap(tabs首页内容Div);
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    return "";
}