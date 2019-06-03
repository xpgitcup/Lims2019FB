var zTreeObjSystemMenu;
// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var settingSystemMenu = {
    callback: {
        onClick: treeNodeSelectedSystemMenu
    }
};
// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
var zNodesSystemMenu;

$(function() {
    console.info(document.title + "加载了...")
    zNodesSystemMenu = loadTreeViewDataSystemMenu();
    zTreeObjSystemMenu = $.fn.zTree.init($("#ztreeSystemMenuUl"), settingSystemMenu, zNodesSystemMenu);
    zTreeObjSystemMenu.expandAll(true);
});

function loadTreeViewDataSystemMenu()
{
    var url = "operation4SystemMenu/getTreeViewData";
    var json = ajaxCall(url);
    return json
}

/*
* 节点选择
* */
function treeNodeSelectedSystemMenu(event, treeId, treeNode) {
    var node = treeNode.value
    var nodeName = treeNode.name
    console.info("选择" + nodeName);
    if (node) {
        $("#createSystemMenu").attr('href', 'javascript: createSystemMenu(' + node[0] + ')');
        var id = node[0];
        ajaxRun("operation4SystemMenu/getSystemMenu", id, "showSystemMenuDiv");
    }
}

/*
 * 新建
 * */
function createSystemMenu(id) {
    console.info("创建SystemMenu. 上级节点：" + id);
    ajaxRun("operation4SystemMenu/createSystemMenu", id, "showSystemMenuDiv");
}

/*
 * 编辑
 * */
function editSystemMenu(id) {
    console.info("编辑SystemMenu." + id);
    ajaxRun("operation4SystemMenu/edit", id, "showSystemMenuDiv");
}