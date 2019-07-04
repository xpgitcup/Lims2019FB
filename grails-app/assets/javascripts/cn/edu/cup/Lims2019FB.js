bootStrapPaginationSetting.identifier = "Home"
bootStrapPaginationSetting.controller = "home"
bootStrapPaginationSetting.defaultPageSize = 5

var tabs登录前Div;

$(function(){
    console.info(document.title + "加载了...")
    tabs登录前Div = $("#tabs登录前Div");
    //setupPaginationBootStrap(tabs登录前Div);
    setupTabsBootStrap(tabs登录前Div);
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
            $("#currentFilter登录前").html(keyString)
            break
    }
    return  append;
}
