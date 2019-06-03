var zTreeObjThingType;
// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var settingThingType = {
    callback: {
        onClick: treeNodeSelectedThingType
    }
};
// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
var zNodesThingType;

$(function() {
    console.info(document.title + "加载了...")
    zNodesThingType = loadTreeViewDataThingType();
    zTreeObjThingType = $.fn.zTree.init($("#ztreeThingTypeUl"), settingThingType, zNodesThingType);
    zTreeObjThingType.expandAll(true);
});

function loadTreeViewDataThingType()
{
    var url = "operation4ThingType/getTreeViewData";
    var json = ajaxCall(url);
    return json
}

/*
* 节点选择
* */
function treeNodeSelectedThingType(event, treeId, treeNode) {
    var node = treeNode.value[0]
    var name = treeNode.name
    console.info("选择" + node);
    $("#createItem").attr('href', 'javascript: createItem(' + node + ')');
    $("#createItem").html("创建" + node + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + node + ')');
    $("#editItem").html("编辑" + node + '节点');
    $("#currentTitle").html(name);
    showThingType(treeNode);
}

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4ThingType/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

function editItem(id) {
    //var title = getCurrentTabTitle(operation4ThingTypeDiv);
    ajaxRun("operation4ThingType/edit", id, "showThingTypeDiv");
}

function createItem(id) {
    //var title = getCurrentTabTitle(operation4ThingTypeDiv);
    //ajaxRun("operation4ThingType/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4ThingType/create?upType=" + id, 0, "showThingTypeDiv");
}

function createProject(id) {
    //var title = getCurrentTabTitle(operation4ThingTypeDiv);
    //ajaxRun("operation4ThingType/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4ThingType/createProject", id, "showThingTypeDiv");
}

function createCourse(id) {
    //var title = getCurrentTabTitle(operation4ThingTypeDiv);
    //ajaxRun("operation4ThingType/create/?upTitle=" + id, 0, "list" + title + "Div");
    ajaxRun("operation4ThingType/createCourse", id, "showThingTypeDiv");
}

/*
* 显示节点信息
* */
function showThingType(node) {
    if (node) {
        var id = node.value[0];
        ajaxRun("operation4ThingType/show", id, "showThingTypeDiv");
    }
}
