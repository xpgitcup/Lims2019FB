var titleQueryStatementA = "查询维护"

$(function(){
    console.info(document.title + "加载了...")
    setupPaginationQueryStatementA();
    loadQueryStatementACurrentPage();
})

/*
* 初始化分页参数
* */
function setupPaginationQueryStatementA () {
    console.info("处理：" + titleQueryStatementA + "!");
    // 当前页
    var currentPageName = "currentPageQueryStatementA" + titleQueryStatementA;
    var currentPage = 1;
    if (localStorage.hasOwnProperty(currentPageName)) {
        currentPage = parseInt(localStorage.getItem(currentPageName));
    }
    $("#" + currentPageName).html(currentPage);
    // 页长度
    var pageSizeName = "pageSizeQueryStatementA" + titleQueryStatementA;
    var pageSize = 10;
    if (localStorage.hasOwnProperty(pageSizeName)) {
        pageSize = parseInt(localStorage.getItem(pageSizeName))
    } else {
        localStorage.setItem(pageSizeName, pageSize);
    }
    $("#" + pageSizeName).html(pageSize);
    // 总页数
    var total = countDataQueryStatementA();
    var totalPageName = "totalPageQueryStatementA" + titleQueryStatementA;
    var totalPage =  Math.ceil(total/pageSize)
    $("#" + totalPageName).html(totalPage)
}

/*
* 同时存储到两个地方
* */
function showCurrentPageNumber(currentPageNumber) {
    var currentPageName = "currentPageQueryStatementA" + titleQueryStatementA
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPage() {
    var currentPageName ="currentPageQueryStatementA" + titleQueryStatementA;
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
    var totalPageName = "totalPageQueryStatementA" + titleQueryStatementA;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSize() {
    var pageSizeName = "pageSizeQueryStatementA" + titleQueryStatementA;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载末页数据
* */
function loadQueryStatementALastPage() {
    var totalPageName = "totalPageQueryStatementA" + titleQueryStatementA;
    var currentPage = parseInt($("#" + totalPageName).html())
    showCurrentPageNumber(currentPage);
    loadDataQueryStatementA(currentPage);
}

/*
* 加载首页数据
* */
function loadQueryStatementAFirstPage() {
    var currentPage = 1
    showCurrentPageNumber(currentPage);
    loadDataQueryStatementA(currentPage);
}

/*
* 加载当前页数据
* */
function loadQueryStatementACurrentPage() {
    var currentPage = getCurrentPage()
    loadDataQueryStatementA(currentPage);
}

/*
* 向前翻页
* */
function loadQueryStatementAPreviousPage() {
    var currentPage = getCurrentPage()
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumber(currentPage);
    loadDataQueryStatementA(currentPage);
}

/*
* 向后翻页
* */
function loadQueryStatementANextPage() {
    var currentPage = getCurrentPage()
    var totalPage = getTotalPage()
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumber(currentPage);
    loadDataQueryStatementA(currentPage);
}

function loadDataQueryStatementA(currentPage) {
    var pageSize = getPageSize()
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParams()
    var url = "operation4QueryStatementA/list" + pageParams + "&key=" + titleQueryStatementA + append;
    ajaxRun(url, 0, "display" + titleQueryStatementA + "Div");
}

function countDataQueryStatementA() {
    var append = appendParams()
    var url = "operation4QueryStatementA/count?key=" + titleQueryStatementA + append;
    var total = ajaxCalculate(url);
    return total;
}

function appendParams() {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    var append = ""
    var filter = readStorage("filter" + document.title, "false");
    var keyString = readStorage("keyString" + document.title, "");
    switch (filter) {
        case "true":
            append = "待编辑"
            break;
        case "like":
            append = "&like=" + keyString;
            $("#currentFilter").html(keyString)
            break
    }
    return  append;
}


/*
* 统计函数
* */
function countQueryStatementA(title) {
    //console.info(document.title + "+统计......");
    var append = setupAppendParamsQueryStatementA();
    var url = "operation4QueryStatementA/count?key=" + title + append
    //console.info(document.title + " : " + url);
    var total = ajaxCalculate(url);
    console.info(document.title + "+统计......" + total);
    return total
}

/*
* 数据加载函数
* */
function loadQueryStatementA(title, page, pageSize) {
    console.info("数据加载：" + title + " 第" + page + "页/" + pageSize);
    var append = setupAppendParamsQueryStatementA();
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var url = "operation4QueryStatementA/list" + params + "&key=" + title + append;
    console.info(document.title + " : " + url);
    ajaxRun(url, 0, "list" + title + "Div");
}

function setupAppendParamsQueryStatementA() {

    return append;
}

/*
* 定位到需要编辑的记录
* */
function listToDo() {
    console.info(document.title + "+待完成......");
    sessionStorage.setItem("filter" + document.title, "true")
    location.reload();
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
function queryStatement() {
    var keyString = document.getElementById("keyString");
    console.info("查询..." + keyString.value);
    sessionStorage.setItem("filter" + document.title, "like")
    sessionStorage.setItem("keyString" + document.title, keyString.value)
    location.reload();
}

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4QueryStatementA/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}
