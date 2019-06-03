//全局变量定义
bootStrapPaginationSetting.identifier = "Team"
bootStrapPaginationSetting.controller = "operation4TeamTeacherProject"

var tabs任务选择Div;
var tabs任务执行Div;

$(function () {
    console.info(document.title + "加载了...")
    tabs任务选择Div = $("#tabs任务选择Div");
    //setupPaginationBootStrap(tabs任务选择Div);
    setupTabsBootStrap(tabs任务选择Div);

    tabs任务执行Div = $("#tabs任务执行Div");
    //setupPaginationBootStrap(tabs任务执行Div);
    setupTabsBootStrap(tabs任务执行Div);
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    var param = "";
    var key = "currentKey";
    var id = 0;
    tipsOperation4Team = $("#tipsOperation4Team");

    switch (title) {
        case "可选项目":
            tipsOperation4Team.html("可以创建团队，也可以查看团队！");
            break
        case "相关团队":
            key += "可选项目";
            id = readStorage(key, 0);
            console.info("当前id:" + key + "=" + id);
            if (id > 0) {
                param = "&currentThing=" + id;
                tipsOperation4Team.html("查看当前任务相关团队：" + id);
            } else {
                tipsOperation4Team.html("请先选择任务！");
            }
            break
        case "队员列表":
            key += "相关团队";
            id = readStorage(key, 0);
            console.info("当前id:" + key + "=" + id);
            if (id > 0) {
                param = "&currentTeam=" + id;
                tipsOperation4Team.html("查看当前团队：" + id);
            } else {
                tipsOperation4Team.html("请先选择团队！");
            }
            break
    }
    return param;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function listTeam(id) {
    selectCurrentItem(id)
    //selectTabByTitle( "相关团队");
    selectTabByTitle("相关团队");
}

function selectCurrentItem(id) {
    var title = getCurrentTabTitle(tabs任务选择Div)
    sessionStorage.setItem("currentKey" + title, id);
}

function listMembers(id) {
    selectCurrentItem(id)
    selectTabByTitle("队员列表");
}

/*
* 解散团队
* */
function disband(id) {
    ajaxExecute("operation4TeamTeacherProject/disband/" + id)
    location.reload();
}

/*
* 解聘队员
* */
function dismiss(id) {
    var tid = readStorage("currentKey相关团队", 0);
    ajaxExecute("operation4TeamTeacherProject/dismiss/?person=" + id + "&currentTeam=" + tid)
    console.info("解聘：" + id);
    location.reload();
}

function quitTeam(id) {
    ajaxExecute("operation4TeamTeacherProject/quitTeam/" + id);
    selectTabByTitle("select", "相关队员");
    location.reload();
}

function joinTeam(id) {
    ajaxExecute("operation4TeamTeacherProject/joinTeam/" + id)
    selectCurrentItem(id)
    selectTabByTitle("队员列表");
    selectTabByTitle("我参与的")
}

function createTeam(id) {
    console.info("创建团队...");
    selectCurrentItem(id)
    ajaxExecute("operation4TeamTeacherProject/createTeam/" + id)
    selectTabByTitle("相关团队");
    location.reload();
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

