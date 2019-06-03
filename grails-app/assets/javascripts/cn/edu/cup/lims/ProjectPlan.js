var operation4ProjectPlanDiv;
var jsTitle = "当前阶段";
var title4ProjectPlan = [jsTitle];
var isTreeView4ProjectPlan = [true];
var treeData4ProjectPlan;
var currentTeamId;

var operation4ProjectPlanRightDiv;
var titles4ProjectPlanRight = ["当前进度"];
var title4ProjectPlanRight = "当前进度"

var operation4ProjectPlanNeedToFile;
var titleNeedToFile = ["待归档"]
var titleNeedToFiles = [titleNeedToFile]

var localPageSizeProjectPlan = 10;

$(function () {
    console.info("进度维护...")

    operation4ProjectPlanDiv = $("#operation4ProjectPlanDiv");
    currentTeamId = $("#currentTeamId").html();
    $.cookie("currentTeamId", currentTeamId);
    treeData4ProjectPlan = ["operation4ProjectPlan/getTreeViewData?currentTeam=" + currentTeamId];

    // 左侧，计划表
    var settings = {
        divId: operation4ProjectPlanDiv,
        titles: title4ProjectPlan,
        // 有关树形结构的设置
        isTreeView: isTreeView4ProjectPlan,
        treeData: treeData4ProjectPlan,
        treeNodeDoSomeThing: projectPlanNodeSelect, //当节点被选择
        paginationMessage: "",
        pageList: [],
        showPageList: false,
        loadFunction: loadProjectPlan,
        countFunction: countProjectPlan
    }
    configDisplayUI(settings);

    // 右侧，计划表
    operation4ProjectPlanRightDiv = $("#operation4ProjectPlanRightDiv");

    var settingsRight = {
        divId: operation4ProjectPlanRightDiv,
        titles: titles4ProjectPlanRight,
        tabsTitle: title4ProjectPlanRight,
        pageSize: localPageSizeProjectPlan,
        pageList: [1, 3, 5, 10],
        paginationMessage: "",
        loadFunction: loadProjectPlanRight,
        countFunction: countProjectPlanRight
    }
    configDisplayUI(settingsRight);

    // 下面，待归档进度表

    operation4ProjectPlanNeedToFile = $("#operation4ProjectPlanNeedToFile");

    var settingsBottom = {
        divId: operation4ProjectPlanNeedToFile,
        titles: titleNeedToFiles,
        tabsTitle: titleNeedToFile,
        pageSize: localPageSizeProjectPlan,
        pageList: [1, 3, 5, 10],
        paginationMessage: "",
        loadFunction: loadProjectPlan,
        countFunction: countProjectPlan
    }
    configDisplayUI(settingsBottom);

    if (sessionStorage.needToFile > 0) {
        processNeedToFile();
    }
});

/*
* 显示节点信息
* */
function showProjectPlan(node) {
    console.info(jsTitle + "+节点显示......" + node);
    if (node) {
        var id = node.attributes[0];
        ajaxRun("operation4ProjectPlan/show", id, "showProjectPlanDiv");
    }
}

/*
* 节点被选择。。。
* */
function projectPlanNodeSelect(node) {
    console.info(jsTitle + "+节点选择......" + node);
    //showProjectPlan(node);
    //$("#createProjectPlan").attr('href', 'javascript: createProjectPlan(' + node.attributes[0] + ')');
    $("#createProjectPlan").html('上传【' + node.attributes[0] + '】进度');
    $("#fileToProjectPlan").html('归档到【' + node.attributes[0] + '】进度');
    console.info(node);
    console.info("当前节点：" + node.target.id);
    $.cookie("currentProjectPlan", node.target.id);
    $.cookie("currentProjectPlanId", node.attributes[0]);

    var rightDiv = $("#pagination当前进度Div");
    rightDiv.pagination('select');
    console.info(rightDiv + "刷新啊.....");
}

/*
* 统计函数
* */
function countProjectPlanRight(title) {
    console.info(title + "+右侧统计......");
    var currentProjectPlanId = readCookie("currentProjectPlanId", 0);
    var total = ajaxCalculate("operation4ProjectPlan/count?key=" + title
        + "&currentProjectPlanId=" + currentProjectPlanId + "&currentTeam=" + currentTeamId);
    return total
}

/*
* 数据加载函数
* */
function loadProjectPlanRight(title, page, pageSize) {
    console.info(jsTitle + "+右侧数据加载......" + title + " 第" + page + "页/" + pageSize);
    var currentProjectPlanId = readCookie("currentProjectPlanId", 0);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4ProjectPlan/list" + params + "&key=" + title
        + "&currentProjectPlanId=" + currentProjectPlanId + "&currentTeam=" + currentTeamId, 0, "list" + title + "Div");
}

/*
* 统计函数
* */
function countProjectPlan(title) {
    console.info(title + "+统计......");
    var total = ajaxCalculate("operation4ProjectPlan/count?key=" + title + "&currentTeam=" + currentTeamId);
    return total
}

/*
* 数据加载函数
* */
function loadProjectPlan(title, page, pageSize) {
    console.info(jsTitle + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4ProjectPlan/list" + params + "&key=" + title + "&currentTeam=" + currentTeamId, 0, "list" + title + "Div");
}

/*
* 进度归档
* */
function fileToProjectPlan(progress) {
    var currentProjectPlan = readCookie("currentProjectPlanId", 0);
    ajaxExecute("operation4ProjectPlan/fileToProjectPlan?currentProjectPlan=" + currentProjectPlan + "&progress=" + progress);
    location.reload();
}

/*
* 处理创建新文档的归档问题
* */
function processNeedToFile() {
    console.info("处理归档的问题...")
    sessionStorage.needToFile = 0;
}

/*
* 删除归档
* */
function removeProgress(progress) {
    var currentProjectPlan = readCookie("currentProjectPlanId", 0);
    ajaxExecute("operation4ProjectPlan/removeProgress?currentProjectPlan=" + currentProjectPlan + "&progress=" + progress);
    location.reload();
}

/*
* 创建进度的时候，处理文件名
* */
function updateUploadFileName(fileName) {
    var aainput = document.getElementById("uploadedFile");
    $("#supportFileName").attr("value", aainput.files[0].name);
    console.info("所选择的文件：" + fileName);
    console.info(aainput.files[0].name)
}

/*
* 创建新的进度
* */
function createNextProgress(progress) {
    var currentProjectPlan = readCookie("currentProjectPlanId", 0);
    var title = "当前进度";
    ajaxRun("operation4Progress/createNextProgress?currentProjectPlan=" + currentProjectPlan
        + "&nextController=operation4ProjectPlan"
        + "&nextAction=index"
        + "&needToDo=toFile"
        + "&prevProgress=" + progress,
        0, "list" + title + "Div");

}

/*
* 创建新的进度
* */
function createCurrentProgress() {
    var progress = 0;
    var currentProjectPlan = readCookie("currentProjectPlanId", 0);
    var title = "当前进度";
    ajaxRun("operation4Progress/createNextProgress?currentProjectPlan=" + currentProjectPlan
        + "&nextController=operation4ProjectPlan"
        + "&nextAction=index"
        + "&needToDo=toFile"
        + "&prevProgress=" + progress,
        0, "list" + title + "Div");

}

/*
* 编辑进度
* */
function editProgress(progress) {
    var currentProjectPlan = readCookie("currentProjectPlanId", 0);
    var title = "当前进度";
    //$.cookie("nextAction", "toFile");
    ajaxRun("operation4Progress/edit?"
        + "&nextController=operation4ProjectPlan"
        + "&nextAction=index",
        progress, "list" + title + "Div");
}

/*
* 修复支撑文件
* */
function fixSupportFile4Progress(progress) {
    var currentProjectPlan = readCookie("currentProjectPlanId", 0);
    var title = "当前进度";
    //$.cookie("nextAction", "toFile");
    ajaxRun("operation4Progress/fixSupportFile?"
        + "&nextController=operation4ProjectPlan"
        + "&nextAction=index",
        progress, "list" + title + "Div");
}