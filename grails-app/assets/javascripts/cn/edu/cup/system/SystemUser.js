var titleSystemUser = "用户维护"

$(function(){
    console.info(document.title + "加载了...")
    setupPaginationSystemUser();
    loadSystemUserCurrentPage();
})

/*
* 初始化分页参数
* */
function setupPaginationSystemUser () {
    console.info("处理：" + titleSystemUser + "!");
    // 当前页
    var currentPageName = "currentPageSystemUser" + titleSystemUser;
    var currentPage = 1;
    if (localStorage.hasOwnProperty(currentPageName)) {
        currentPage = parseInt(localStorage.getItem(currentPageName));
    }
    $("#" + currentPageName).html(currentPage);
    // 页长度
    var pageSizeName = "pageSizeSystemUser" + titleSystemUser;
    var pageSize = 10;
    if (localStorage.hasOwnProperty(pageSizeName)) {
        pageSize = parseInt(localStorage.getItem(pageSizeName))
    } else {
        localStorage.setItem(pageSizeName, pageSize);
    }
    $("#" + pageSizeName).html(pageSize);
    // 总页数
    var total = countDataSystemUser();
    var totalPageName = "totalPageSystemUser" + titleSystemUser;
    var totalPage =  Math.ceil(total/pageSize)
    $("#" + totalPageName).html(totalPage)
}

/*
* 同时存储到两个地方
* */
function showCurrentPageNumber(currentPageNumber) {
    var currentPageName = "currentPageSystemUser" + titleSystemUser
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPage() {
    var currentPageName ="currentPageSystemUser" + titleSystemUser;
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
function getTotalPage() {
    var totalPageName = "totalPageSystemUser" + titleSystemUser;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSize() {
    var pageSizeName = "pageSizeSystemUser" + titleSystemUser;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载首页数据
* */
function loadSystemUserLastPage() {
    var totalPageName = "totalPageSystemUser" + titleSystemUser;
    var currentPage = parseInt($("#" + totalPageName).html())
    showCurrentPageNumber(currentPage);
    loadDataSystemUser(currentPage);
}

/*
* 加载首页数据
* */
function loadSystemUserFirstPage() {
    var currentPage = 1
    showCurrentPageNumber(currentPage);
    loadDataSystemUser(currentPage);
}

/*
* 加载当前页数据
* */
function loadSystemUserCurrentPage() {
    var currentPage = getCurrentPage()
    loadDataSystemUser(currentPage);
}

/*
* 向前翻页
* */
function loadSystemUserPreviousPage() {
    var currentPage = getCurrentPage()
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumber(currentPage);
    loadDataSystemUser(currentPage);
}

/*
* 向后翻页
* */
function loadSystemUserNextPage() {
    var currentPage = getCurrentPage()
    var totalPage = getTotalPage()
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumber(currentPage);
    loadDataSystemUser(currentPage);
}

function loadDataSystemUser(currentPage) {
    var pageSize = getPageSize()
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParams()
    var url = "operation4SystemUser/list" + pageParams + "&key=" + titleSystemUser + append;
    ajaxRun(url, 0, "display" + titleSystemUser + "Div");
}

function countDataSystemUser() {
    var append = appendParams()
    var url = "operation4SystemUser/count?key=" + titleSystemUser + append;
    var total = ajaxCalculate(url);
    return total;
}

function appendParams() {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    var append = ""
    var filter = readStorage("filter" + document.title, "false");
    var keyString = readStorage("keyString" + document.title, "");
    switch (filter) {
        case "like":
            append = "&like=" + keyString;
            $("#currentFilter").html(keyString)
            break
    }
    return  append;
}

/*
* 清除过滤条件
* */
function clearFilter() {
    sessionStorage.setItem("filter" + document.title, false)
    location.reload();
}

/*
* 查询
* */
function querySystemUser() {
    var keyString = document.getElementById("keyString");
    console.info("查询..." + keyString.value);
    sessionStorage.setItem("filter" + document.title, "like")
    sessionStorage.setItem("keyString" + document.title, keyString.value)
    location.reload();
}

/*
 * 新建
 * */
function createSystemUser(id) {
    console.info("创建SystemUser. 上级节点：" + id);
    ajaxRun("operation4SystemUser/create", id, "showSystemUserDiv");
}

/*
 * 编辑
 * */
function editSystemUser(id) {
    console.info("编辑SystemUser." + id);
    ajaxRun("operation4SystemUser/edit", id, "showSystemUserDiv");
}

/*
 * 显示当前属性
 * */
function showSystemUser(id) {
    console.info("显示当前" + id);
    if (id) {
        ajaxRun("operation4SystemUser/show", id, "showSystemUserDiv");
    }
}

