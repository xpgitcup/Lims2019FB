$(function(){
    console.info(document.title + "加载了...")
    setupPaginationHome();
    setupTabsHome();
})

/*
* 初始化分页参数
* */
function setupPaginationHome () {
    // 对每个标签进行操作
    var tabs = $("a.nav-link");
    tabs.each(function (e) {
        var title = tabs[e].text.trim();
        console.info("处理：" + title + "!");
        // 当前页
        var currentPageName = "currentPageHome" + title;
        var currentPage = 1;
        if (localStorage.hasOwnProperty(currentPageName)) {
            currentPage = parseInt(localStorage.getItem(currentPageName));
        }
        $("#" + currentPageName).html(currentPage);
        // 页长度
        var pageSizeName = "pageSizeHome" + title;
        var pageSize = 10;
        if (localStorage.hasOwnProperty(pageSizeName)) {
            pageSize = parseInt(localStorage.getItem(pageSizeName))
        } else {
            localStorage.setItem(pageSizeName, pageSize);
        }
        $("#" + pageSizeName).html(pageSize);
        // 总页数
        var total = countDataHome(title);
        var totalPageName = "totalPageHome" + title;
        var totalPage =  Math.ceil(total/pageSize)
        $("#" + totalPageName).html(totalPage)
    })

}

function setupTabsHome() {
    var currentTabName = "currentTabHome登录后";
    // 每个标签绑定数据加载函数
    $("a.nav-link").on("click", function (e) {
        var title = $(e.target).text().trim();
        console.info("点击事件..." + title + "!")
        localStorage.setItem(currentTabName, title); //记录缺省标签
        loadHomeCurrentPage(title)
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
    var currentPageName = "currentPageHome" + title
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPage(title) {
    var currentPageName ="currentPageHome" + title;
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
    var totalPageName = "totalPageHome" + title;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSize(title) {
    var pageSizeName = "pageSizeHome" + title;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载尾页数据
* */
function loadHomeLastPage(title) {
    var currentPage = 1;//getCurrentPage(title)
    var totalPageName = "totalPageHome" + title;
    currentPage = parseInt($("#" + totalPageName).html())
    showCurrentPageNumber(title, currentPage);
    loadDataHome(title, currentPage);
}

/*
* 加载首页数据
* */
function loadHomeFirstPage(title) {
    var currentPage = 1;//getCurrentPage(title)
    showCurrentPageNumber(title, currentPage);
    loadDataHome(title, currentPage);
}

/*
* 加载当前页数据
* */
function loadHomeCurrentPage(title) {
    var currentPage = getCurrentPage(title)
    loadDataHome(title, currentPage);
}

/*
* 向前翻页
* */
function loadHomePreviousPage(title) {
    var currentPage = getCurrentPage(title)
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumber(title, currentPage);
    loadDataHome(title, currentPage);
}

/*
* 向后翻页
* */
function loadHomeNextPage(title, currentPage) {
    var currentPage = getCurrentPage(title)
    var totalPage = getTotalPage(title)
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumber(title, currentPage);
    loadDataHome(title, currentPage);
}

function loadDataHome(title, currentPage) {
    var pageSize = getPageSize(title)
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParams(title)
    var url = "home/list" + pageParams + "&key=" + title + append;
    ajaxRun(url, 0, "display" + title + "Div");
}

function countDataHome(title) {
    var url = "home/count?key=" + title;
    var total = ajaxCalculate(url);
    return total;
}

function appendParams(title) {
    return "";
}