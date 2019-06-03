/**
 * Created by LiXiaoping on 2019/2/6.
 *
 * 缺省的页面长度=10
 * 用对象传递参数，这样保证所有的函数只有一个传入参数
 * 标签页、面板页--能够二合一，只有一个标签的时候，就是面板；多余一个就是标签
 *
 */

var defaultPageSize = 10

function getCurrentTabIndex(tabsDiv) {
    var tab = getCurrentTab(tabsDiv)
    var index = tabsDiv.tabs('getTabIndex', tab);
    return index
}

function getCurrentTabTitle(tabsDiv) {
    var tab = getCurrentTab(tabsDiv)
    return tab.panel("options").title;
}

function getCurrentTab(tabsDiv) {
    var tab = tabsDiv.tabs('getSelected');
    return tab;
}

/*
* 设置页面的指示信息
* */
function setupDisplayUl(ulId, tabsNameList) {
    for (i in tabsNameList) {
        var title = tabsNameList[i];
        var lia = $("<li>当前[" + title + "]：</li>");
        var lib = $("<li></li>");
        var lic = $("<li>||</li>");
        lib.attr("id", "currentKey" + title);
        lia.appendTo(ulId);
        lib.appendTo(ulId);
        lic.appendTo(ulId);
    }
}

/*
* 刷新页面的指示信息
* */
function reflashDisplayUl(ulId, tabsNameList) {
    for (i in tabsNameList) {
        var title = tabsNameList[i];
        var key = "currentKey" + title;
        var id = readCookie(key, -1);
        $("#" + key).html(id);
    }
}

/*
* 读取、调入所有页面指示标志
* */
function loadAllDisplayTitleId(idList) {
    var currentId
    var ids = new Array()
    for (index in idList) {
        currentId = readCookie("currentKey" + idList[index], 0)
        ids[index] = currentId
    }
    return ids
}

/*
* 显示界面配置函数
* */
function configDisplayUI(settings) {
    var theDiv = settings.divId;
    var titles = settings.titles;

    var loadFunction = eval(settings.loadFunction);
    var countFunction = eval(settings.countFunction);
    var treeNodeDoSomeThing = eval(settings.treeNodeDoSomeThing)

    var paginationMessage = settings.paginationMessage;
    var pageList = settings.pageList;

    var panelDiv;
    var tabsDiv;
    var paginationDiv;
    var treeViewUl;
    var localPageSize;

    //处理页面长度
    if (settings.pageSize) {
        localPageSize = settings.pageSize;
    } else {
        localPageSize = defaultPageSize;
    }

    console.info(settings.isTreeView);


    if (titles.length < 2) {
        console.info("只有一个Panel的情况：" + settings.isTreeView);
        configSinglePanel();
        var doReflash = true
        if (settings.isTreeView) {
            doReflash = !(settings.isTreeView[0])
        }
        console.info("是否：" + doReflash);
        if (doReflash) {
            console.info("强制加载...")
            paginationDiv.pagination('select')
        }
    } else {
        // 多个标签页面的情况
        configTabs();
    }

    /*
    * 私有函数
    * */
    function configTabs() {
        var tabsName = settings.tabsTitle;
        tabsDiv = theDiv;
        for (var i in titles) {
            var title = titles[i];
            tabsDiv.tabs('add', {
                title: title,
                closable: false
            })
            //插入到tab中
            tabsDiv.tabs('select', i)
            var tab = tabsDiv.tabs('getSelected');
            var listDiv = addNewNormalDiv(title, tab);
            var paginationDiv = addNewPaginationDiv(title, tab);
        }
        // 设置参数
        console.info("开始设置多标签页的参数......")
        // 当前页
        var defaultTab = tabsDiv.tabs("tabs")[0].panel("options").title
        console.info("缺省标签标题：" + defaultTab);
        var currentTab = readCookie("current" + tabsName, defaultTab);

        tabsDiv.tabs({
            onSelect: function (title, index) {
                //记录tabs的缺省页面，所以采用tabsName
                console.info(tabsName + "--选择标签：" + title + "--" + index);
                //$.cookie("current" + tabsName, title, {path: '/'});
                $.cookie("current" + tabsName, title);
                //------------------------------------------------------------------------------------------------------
                var cPageNumber = readCookie("currentPage" + title, 1)
                loadFunction(title, cPageNumber, localPageSize)
                // 设置翻页
                configPagination(title);
            }
        });
        // 打开缺省的标签
        tabsDiv.tabs("select", currentTab);
    }

    /*
    * 设置分页参数
    * */
    function configPagination(title) {
        var paginationDiv = $("#pagination" + title + "Div")
        var currentPage = readCookie("currentPage" + title, 1);
        var total = countFunction(title)
        paginationDiv.pagination({
            pageSize: localPageSize,
            total: total,
            pageList: pageList, //[1, 3, 5, 10, 20, 30],
            showPageList: settings.showPageList,
            pageNumber: currentPage,
            displayMsg: paginationMessage,
            onSelectPage: function (pageNumber, pageSize) {
                console.info("setupPaginationParams4TabPage: " + title)
                $.cookie("currentPage" + title, pageNumber);     //记录当前页面
                loadFunction(title, pageNumber, pageSize);
            }
        })
        return currentPage;
    }

    /*
     * 设置单个Panel
     * */
    function configSinglePanel() {
        var title = titles[0];
        // 添加显示元件
        panelDiv = addNewPanelDiv(title, theDiv);

        if (settings.isTreeView != undefined) {
            if (settings.isTreeView[0]) {
                treeViewUl = addNewTreeView(title, theDiv);
                console.info("创建树形结构!")
            }
        }

        paginationDiv = addNewPaginationDiv(title, theDiv);
        // 设置参数
        console.info("开始设置参数......")

        // 分页处理
        var currentPage = configPagination(title);
        // 单页的显示--加载数据
        if ((settings.isTreeView == undefined)) {
            panelDiv.panel({
                href: loadFunction(title, currentPage, localPageSize)
            })
        } else {
            if (settings.isTreeView[0]) {
                treeViewUl.tree({
                    url: settings.treeData[0],
                    onSelect: function (node) {
                        console.info("树形结构节点选择：" + node.target.id);
                        $.cookie("currentNode" + title, node.target.id);
                        treeNodeDoSomeThing(node)
                    },
                    onLoadSuccess: function () {
                        var cnodeid = readCookie("currentNode" + title, 0);
                        console.info("上一次：" + cnodeid);
                        treeViewUl.tree("collapseAll");
                        if (cnodeid != 0) {
                            console.info("扩展到：" + cnodeid);
                            var cnode = $("#" + cnodeid);
                            treeViewUl.tree("expandTo", cnode);
                            treeViewUl.tree("select", cnode);
                        }
                    }
                })
            }
        }
    }

    function addTabsDiv(title, parentDiv) {
        var tabsDiv = $('<div class="easyui-tabs"></div>');
        tabsDiv.attr("id", "tabs" + title + "Div");
        tabsDiv.appendTo(parentDiv);
        return tabsDiv;
    }

    function addNewPaginationDiv(title, parentDiv) {
        //分页Div------加入到标签中
        var paginationDiv = $('<div class="easyui-pagination"></div>');
        paginationDiv.attr('id', 'pagination' + title + 'Div');
        paginationDiv.appendTo(parentDiv)
        return paginationDiv;
    }

    function addNewTreeView(title, parentDiv) {
        //树形显示页面
        console.info("创建树形结构：" + title);
        var treeViewUl = $('<ul class="easyui-tree"></ul>');
        treeViewUl.attr('id', 'treeView' + title + 'Ul');
        treeViewUl.appendTo(parentDiv)
        return treeViewUl;
    }

    function addNewNormalDiv(title, parentDiv) {
        //显示页面
        var listDiv = $('<div></div>');
        listDiv.attr('id', 'list' + title + 'Div');
        listDiv.appendTo(parentDiv)
        return listDiv;
    }

    function addNewPanelDiv(title, parentDiv) {
        //显示页面
        var listDiv = $('<div></div>');
        listDiv.attr('id', 'list' + title + 'Div');
        listDiv.attr("class", "easyui-panel");
        listDiv.attr("title", title);
        listDiv.appendTo(parentDiv)
        return listDiv;
    }

}