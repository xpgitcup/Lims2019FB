var zTreeObjSystemAttribute;
// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var settingSystemAttribute = {
    callback: {
        onClick: treeNodeSelectedSystemAttribute
    }
};
// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
var zNodesSystemAttribute;

$(function() {
    console.info(document.title + "加载了...")
    zNodesSystemAttribute = loadTreeViewDataSystemAttribute();
    zTreeObjSystemAttribute = $.fn.zTree.init($("#ztreeSystemAttributeUl"), settingSystemAttribute, zNodesSystemAttribute);
    zTreeObjSystemAttribute.expandAll(true);
});

function loadTreeViewDataSystemAttribute()
{
    var url = "operation4SystemAttribute/getTreeViewData";
    var json = ajaxCall(url);
    return json
}

/*
* 节点选择
* */
function treeNodeSelectedSystemAttribute(event, treeId, treeNode) {
    var node = treeNode.name
    console.info("选择" + node);
    var id = treeNode.value[0]
    if (node) {
        ajaxRun("operation4SystemAttribute/show", id, "showSystemAttributeDiv");
        $("#createSystemAttribute").attr('href', 'javascript: createSystemAttribute(' + id + ')');
    }
}

/*
* 新建
* */
function createSystemAttribute(id) {
    console.info("创建SystemAttribute. 上级节点：" + id);
    ajaxRun("operation4SystemAttribute/createSystemAttribute", id, "showSystemAttributeDiv");
}

/*
* 编辑
* */
function editSystemAttribute(id) {
    console.info("编辑SystemAttribute." + id);
    ajaxRun("operation4SystemAttribute/edit", id, "showSystemAttributeDiv");
}

