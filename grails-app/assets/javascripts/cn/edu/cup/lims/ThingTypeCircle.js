var zTreeObjThingType;
var zTreeObjPersonTitle;

// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var settingThingType = {
    callback: {
        onClick: treeNodeSelectedThingType
    }
};
// zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
var settingPersonTitle = {
    callback: {
        onClick: treeNodeSelectedPersonTitle
    }
};

// zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
var zNodesThingType;
var zNodesPersonTitle;

$(function() {
    console.info(document.title + "加载了...")
    zNodesPersonTitle = loadTreeViewDataPersonTitle();
    zTreeObjPersonTitle = $.fn.zTree.init($("#ztreePersonTitleUl"), settingPersonTitle, zNodesPersonTitle);
    zTreeObjPersonTitle.expandAll(true)

    zNodesThingType = loadTreeViewDataThingType();
    zTreeObjThingType = $.fn.zTree.init($("#ztreeThingTypeUl"), settingThingType, zNodesThingType);
    zTreeObjThingType.expandAll(true);

    setupPaginationThingTypeCircle();
    setupTabsThingTypeCircle();
});


/*
* 初始化分页参数
* */
function setupPaginationThingTypeCircle () {
    // 对每个标签进行操作
    var tabs = $("a.nav-link");
    tabs.each(function (e) {
        var title = tabs[e].text.trim();
        console.info("处理：" + title + "!");
        // 当前页
        var currentPageName = "currentPageThingTypeCircle" + title;
        var currentPage = 1;
        if (localStorage.hasOwnProperty(currentPageName)) {
            currentPage = parseInt(localStorage.getItem(currentPageName));
        }
        $("#" + currentPageName).html(currentPage);
        // 页长度
        var pageSizeName = "pageSizeThingTypeCircle" + title;
        var pageSize = 10;
        if (localStorage.hasOwnProperty(pageSizeName)) {
            pageSize = parseInt(localStorage.getItem(pageSizeName))
        } else {
            localStorage.setItem(pageSizeName, pageSize);
        }
        $("#" + pageSizeName).html(pageSize);
        // 总页数
        var total = countDataThingTypeCircle(title);
        var totalPageName = "totalPageThingTypeCircle" + title;
        var totalPage =  Math.ceil(total/pageSize)
        $("#" + totalPageName).html(totalPage)
    })

}

function setupTabsThingTypeCircle() {
    var currentTabName = "currentTabThingTypeCircle任务分配";
    // 每个标签绑定数据加载函数
    $("a.nav-link").on("click", function (e) {
        var title = $(e.target).text().trim();
        console.info("点击事件..." + title + "!")
        localStorage.setItem(currentTabName, title); //记录缺省标签
        loadThingTypeCircleCurrentPage(title)
    })
    // 处理缺省标签
    if (localStorage.hasOwnProperty(currentTabName)) {
        var title = localStorage.getItem(currentTabName);
        console.info("激活" + title);
        var url = "a.nav-link:contains('" + title + "')"
        var tab = $(url)
        if (tab != undefined) {
            tab.click()
        } else {
            // 激活第一个
            $("a.nav-link:first").click()
        }
    } else {
        // 激活第一个
        $("a.nav-link:first").click()
    }

}

/*
* 同时存储到两个地方
* */
function showCurrentPageNumber(title, currentPageNumber) {
    var currentPageName = "currentPageThingTypeCircle" + title
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPage(title) {
    var currentPageName ="currentPageThingTypeCircle" + title;
    var currentPageNumber
    if (localStorage.hasOwnProperty(currentPageName)) {
        currentPageNumber = parseInt(localStorage.getItem(currentPageName))
    } else {
        currentPageNumber = 1
        localStorage.setItem(currentPageName, currentPageNumber)
    }
    return currentPageNumber
}

/*
* 获取页码上限
* */
function getTotalPage(title) {
    var totalPageName = "totalPageThingTypeCircle" + title;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSize(title) {
    var pageSizeName = "pageSizeThingTypeCircle" + title;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载尾页数据
* */
function loadThingTypeCircleLastPage(title) {
    var currentPage = 1;//getCurrentPage(title)
    var totalPageName = "totalPageThingTypeCircle" + title;
    currentPage = parseInt($("#" + totalPageName).html())
    showCurrentPageNumber(title, currentPage);
    loadDataThingTypeCircle(title, currentPage);
}

/*
* 加载首页数据
* */
function loadThingTypeCircleFirstPage(title) {
    var currentPage = 1;//getCurrentPage(title)
    showCurrentPageNumber(title, currentPage);
    loadDataThingTypeCircle(title, currentPage);
}

/*
* 加载当前页数据
* */
function loadThingTypeCircleCurrentPage(title) {
    var currentPage = getCurrentPage(title)
    loadDataThingTypeCircle(title, currentPage);
}

/*
* 向前翻页
* */
function loadThingTypeCirclePreviousPage(title) {
    var currentPage = getCurrentPage(title)
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumber(title, currentPage);
    loadDataThingTypeCircle(title, currentPage);
}

/*
* 向后翻页
* */
function loadThingTypeCircleNextPage(title, currentPage) {
    var currentPage = getCurrentPage(title)
    var totalPage = getTotalPage(title)
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumber(title, currentPage);
    loadDataThingTypeCircle(title, currentPage);
}

function loadDataThingTypeCircle(title, currentPage) {
    var pageSize = getPageSize(title)
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParams(title)
    var url = "operation4ThingTypeCircle/list" + pageParams + "&key=" + title + append;
    ajaxRun(url, 0, "display" + title + "Div");
}

function countDataThingTypeCircle(title) {
    var url = "operation4ThingTypeCircle/count?key=" + title;
    var total = ajaxCalculate(url);
    return total;
}

function appendParams(title) {
    return "";
}


//----------------------------------------------------------------------------------------------------------------------
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
    var node = treeNode.name
    var nodeId = treeNode.value[0]
    console.info("选择" + node);
    $("#thingType").attr("value", nodeId)
}

//----------------------------------------------------------------------------------------------------------------------

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
    var node = treeNode.name
    var nodeId = treeNode.value[0]
    console.info("选择" + node);
    $("#personTitle").attr("value", nodeId)
}




/////////////////////////////////////////////////////////

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4ThingTypeCircle/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

/*
* 定位到需要编辑的记录
* */
function listToDo() {
    console.info(jsTitleThingTypeCircle + "+待完成......");
    var title = jsTitleThingTypeCircle;
    var page = 1;   //每次都定位到第一页
    var params = getParams(page, localPageSizeThingTypeCircle);    //getParams必须是放在最最前面！！
    ajaxRun("operation4ThingTypeCircle/list" + params + "&key=" + title + ".TODO", 0, "list" + title + "Div");
}

function shiftDisplay(title) {
    console.info("显示当前提示...")
    $("#currentTemplate").html("下载[" + title + "]模板");
    $("#currentTemplate").attr("href", "operation4ThingTypeCircle/downloadTemplate?key=" + title);
    $("#currentImport").html("导入[" + title + "]数据");
    $("#importKey").attr("value", title);
}

function changeUpNode(node) {
    console.info("修改根节点的id...")
    $("#createItem").attr('href', 'javascript: createItem(' + node.attributes[0] + ')');
    $("#createItem").html("创建" + node.attributes[0] + '的子节点');
    $("#editItem").attr('href', 'javascript: editItem(' + node.attributes[0] + ')');
    $("#editItem").html("编辑" + node.attributes[0] + '节点');
    $("#deleteItem").attr('href', 'operation4ThingTypeCircle/delete/' + node.attributes[0]);
    $("#deleteItem").html("删除" + node.attributes[0] + '节点');
    $("#currentTitle").html(node.text);
    ajaxRun("operation4ThingTypeCircle/show", node.attributes[0], "showInformationDiv");
}

