var titleDataRootPath = "数据根目录"

$(function(){
    console.info(document.title + "加载了...")
    setupPaginationDataRootPath();
    loadDataRootPathCurrentPage();
})

/*
* 初始化分页参数
* */
function setupPaginationDataRootPath () {
    console.info("处理：" + titleDataRootPath + "!");
    // 当前页
    var currentPageName = "currentPageDataRootPath" + titleDataRootPath;
    var currentPage = 1;
    if (localStorage.hasOwnProperty(currentPageName)) {
        currentPage = parseInt(localStorage.getItem(currentPageName));
    }
    $("#" + currentPageName).html(currentPage);
    // 页长度
    var pageSizeName = "pageSizeDataRootPath" + titleDataRootPath;
    var pageSize = 10;
    if (localStorage.hasOwnProperty(pageSizeName)) {
        pageSize = parseInt(localStorage.getItem(pageSizeName))
    } else {
        localStorage.setItem(pageSizeName, pageSize);
    }
    $("#" + pageSizeName).html(pageSize);
    // 总页数
    var total = countDataDataRootPath();
    var totalPageName = "totalPageDataRootPath" + titleDataRootPath;
    var totalPage =  Math.ceil(total/pageSize)
    $("#" + totalPageName).html(totalPage)
}

/*
* 同时存储到两个地方
* */
function showCurrentPageNumber(currentPageNumber) {
    var currentPageName = "currentPageDataRootPath" + titleDataRootPath
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPage() {
    var currentPageName ="currentPageDataRootPath" + titleDataRootPath;
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
    var totalPageName = "totalPageDataRootPath" + titleDataRootPath;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSize() {
    var pageSizeName = "pageSizeDataRootPath" + titleDataRootPath;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载当前页数据
* */
function loadDataRootPathCurrentPage() {
    var currentPage = getCurrentPage()
    loadDataDataRootPath(currentPage);
}

/*
* 向前翻页
* */
function loadDataRootPathPreviousPage() {
    var currentPage = getCurrentPage()
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumber(currentPage);
    loadDataDataRootPath(currentPage);
}

/*
* 向后翻页
* */
function loadDataRootPathNextPage() {
    var currentPage = getCurrentPage()
    var totalPage = getTotalPage()
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumber(currentPage);
    loadDataDataRootPath(currentPage);
}

function loadDataDataRootPath(currentPage) {
    var pageSize = getPageSize()
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParams()
    var url = "operation4DataRootPath/list" + pageParams + "&key=" + titleDataRootPath + append;
    ajaxRun(url, 0, "display" + titleDataRootPath + "Div");
}

function countDataDataRootPath() {
    var append = appendParams()
    var url = "operation4DataRootPath/count?key=" + titleDataRootPath + append;
    var total = ajaxCalculate(url);
    return total;
}

function appendParams() {
    return "";
}

/*
* 统计函数
* */
function countDataRootPath(title) {
    console.info(document.title + "+统计......");
    var append = setupAppendParamsDataRootPath();
    var url = "operation4DataRootPath/count?key=" + title + append
    console.info(document.title + " : " + url);
    var total = ajaxCalculate(url);
    return total
}

/*
* 数据加载函数
* */
function loadDataRootPath(title, page, pageSize) {
    console.info(document.title + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var append = setupAppendParamsDataRootPath();
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var url = "operation4DataRootPath/list" + params + "&key=" + title + append;
    console.info(document.title + " : " + url);
    ajaxRun(url, 0, "list" + title + "Div");
}

function setupAppendParamsDataRootPath() {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    return "";
}

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4DataRootPath/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

/*
* 查询
* */
function DataRootPath() {
    var keyString = document.getElementById("keyString");
    //alert("查询..." + keyString.value);
    console.info("查询..." + keyString.value);
    $.cookie("filter", true);
    $.cookie("keyString", keyString.value);
    //$("#currentFilter").html(keyString.value);
    location.reload();
}

