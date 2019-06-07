bootStrapPaginationSetting.identifier = "Thing"
bootStrapPaginationSetting.controller = "operation4Thing"

var tabs项目维护Div;

$(function(){
    console.info(document.title + "加载了...")
    tabs项目维护Div = $("#tabs项目维护Div");
    //setupPaginationBootStrap(tabs项目维护Div);
    setupTabsBootStrap(tabs项目维护Div);
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
    return "";
}

function editProject(id) {
    console.info("编辑项目信息...");
    var title = getCurrentTabTitle(tabs项目维护Div);
    ajaxRun("operation4Thing/editProject", id, "list" + title + "Div");
}

function createProject(title) {
    console.info("创建教学任务...");
    //var title = getCurrentTabTitle(operation4ThingDiv);
    ajaxRun("operation4Thing/createProject", 0, "list" + title + "Div");
}

function createCourse(title) {
    console.info("创建教学任务...");
    //var title = getCurrentTabTitle(operation4ThingDiv);
    ajaxRun("operation4Thing/createCourse", 0, "list" + title + "Div");
}

function deleteCourse(id) {
    console.info("删除教学任务：" + id);
    ajaxExecuteWithMethod("operation4Thing/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

/*
* 定位到需要编辑的记录
* */
function listToDo() {
    console.info(jsTitleThing + "+待完成......");
    var title = jsTitleThing;
    var page = 1;   //每次都定位到第一页
    var params = getParams(page, localPageSizeThing);    //getParams必须是放在最最前面！！
    ajaxRun("operation4Thing/list" + params + "&key=" + title + ".TODO", 0, "list" + title + "Div");
}

