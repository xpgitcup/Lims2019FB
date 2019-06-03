var zTreeObjPersonTitle;
// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var settingPersonTitle = {
    callback: {
        onClick: treeNodeSelectedPersonTitle
    }
};
// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
var zNodesPersonTitle;

$(function() {
    console.info(document.title + "加载了...")
    zNodesPersonTitle = loadTreeViewDataPersonTitle();
    zTreeObjPersonTitle = $.fn.zTree.init($("#ztreePersonTitleUl"), settingPersonTitle, zNodesPersonTitle);
    zTreeObjPersonTitle.expandAll(true);
});

function loadTreeViewDataPersonTitle()
{
    var url = "operation4PersonTitle/getTreeViewData";
    var json = ajaxCall(url);
    return json
}

/*
* 节点选择
* */
function treeNodeSelectedPersonTitle(event, treeId, treeNode) {
    console.info("选择" + treeNode);
    var nodeid = treeNode.value[0]
    $("#createItem").attr('href', 'javascript: createItem(' + nodeid + ')');
    $("#createItem").html("创建" + nodeid + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + nodeid + ')');
    $("#editItem").html("编辑" + nodeid + '节点');
    $("#deleteItem").attr('href', 'javascript: deleteItem(' + nodeid + ')');
    $("#deleteItem").html("删除" + nodeid + '节点');
    $("#currentTitle").html(treeNode.name);
    showPersonTitle(treeNode);
}

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4PersonTitle/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

function editItem(id) {
    ajaxRun("operation4PersonTitle/edit", id, "showPersonTitleDiv");
}

/*
* 新建
* */
function createItem(id) {
    ajaxRun("operation4PersonTitle/create?upTitle=" + id, 0, "showPersonTitleDiv");
}

function createPersonTitle(id) {
    console.info("创建PersonTitle. 上级节点：" + id);
    ajaxRun("operation4PersonTitle/createPersonTitle", id, "showPersonTitleDiv");
}

/*
* 编辑
* */
function editPersonTitle(id) {
    console.info("编辑PersonTitle." + id);
    ajaxRun("operation4PersonTitle/editPersonTitle", id, "showPersonTitleDiv");
}

/*
* 显示节点信息
* */
function showPersonTitle(node) {
    if (node) {
        var id = node.value[0];
        ajaxRun("operation4PersonTitle/show", id, "showPersonTitleDiv");
    }
}

/*
* 统计函数
* */
function countPersonTitle(title) {
    console.info(jsTitle + "+统计......");
    var total = ajaxCalculate("operation4PersonTitle/count?key=" + title);
    return total
}

/*
* 数据加载函数
* */
function loadPersonTitle(title, page, pageSize) {
    console.info(jsTitle + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4PersonTitle/list" + params + "&key=" + title, 0, "list" + title + "Div");
}