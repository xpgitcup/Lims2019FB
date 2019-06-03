$(function(){
    console.info(document.title + "加载了...")
    setupPaginationPerson();
    setupTabsPerson();
})

/*
* 初始化分页参数
* */
function setupPaginationPerson () {
    // 对每个标签进行操作
    var tabs = $("a.nav-link");
    tabs.each(function (e) {
        var title = tabs[e].text.trim();
        console.info("处理：" + title + "!");
        // 当前页
        var currentPageName = "currentPagePerson" + title;
        var currentPage = 1;
        if (localStorage.hasOwnProperty(currentPageName)) {
            currentPage = parseInt(localStorage.getItem(currentPageName));
        }
        $("#" + currentPageName).html(currentPage);
        // 页长度
        var pageSizeName = "pageSizePerson" + title;
        var pageSize = 10;
        if (localStorage.hasOwnProperty(pageSizeName)) {
            pageSize = parseInt(localStorage.getItem(pageSizeName))
        } else {
            localStorage.setItem(pageSizeName, pageSize);
        }
        $("#" + pageSizeName).html(pageSize);
        // 总页数
        var total = countDataPerson(title);
        var totalPageName = "totalPagePerson" + title;
        var totalPage =  Math.ceil(total/pageSize)
        $("#" + totalPageName).html(totalPage)
    })

}

function setupTabsPerson() {
    var currentTabName = "currentTabPerson人员数据";
    // 每个标签绑定数据加载函数
    $("a.nav-link").on("click", function (e) {
        var title = $(e.target).text().trim();
        console.info("点击事件..." + title + "!")
        localStorage.setItem(currentTabName, title); //记录缺省标签
        loadPersonCurrentPage(title)
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
    var currentPageName = "currentPagePerson" + title
    $("#" + currentPageName).html(currentPageNumber);
    localStorage.setItem(currentPageName, currentPageNumber);
}

/*
* 获取当前页---从localStorage中获取
* */
function getCurrentPage(title) {
    var currentPageName ="currentPagePerson" + title;
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
    var totalPageName = "totalPagePerson" + title;
    var totalPage = parseInt($("#" + totalPageName).html());
    return totalPage;
}

/*
* 获取页面长度
* */
function getPageSize(title) {
    var pageSizeName = "pageSizePerson" + title;
    var pageSize = parseInt(localStorage.getItem(pageSizeName))
    return pageSize
}

/*
* 加载尾页数据
* */
function loadPersonLastPage(title) {
    var currentPage = 1;//getCurrentPage(title)
    var totalPageName = "totalPagePerson" + title;
    currentPage = parseInt($("#" + totalPageName).html())
    showCurrentPageNumber(title, currentPage);
    loadDataPerson(title, currentPage);
}

/*
* 加载首页数据
* */
function loadPersonFirstPage(title) {
    var currentPage = 1;//getCurrentPage(title)
    showCurrentPageNumber(title, currentPage);
    loadDataPerson(title, currentPage);
}

/*
* 加载当前页数据
* */
function loadPersonCurrentPage(title) {
    var currentPage = getCurrentPage(title)
    loadDataPerson(title, currentPage);
}

/*
* 向前翻页
* */
function loadPersonPreviousPage(title) {
    var currentPage = getCurrentPage(title)
    currentPage = currentPage - 1;
    if (currentPage < 1) {
        currentPage = 1;
    }
    showCurrentPageNumber(title, currentPage);
    loadDataPerson(title, currentPage);
}

/*
* 向后翻页
* */
function loadPersonNextPage(title, currentPage) {
    var currentPage = getCurrentPage(title)
    var totalPage = getTotalPage(title)
    currentPage = currentPage + 1;
    if (currentPage > totalPage) {
        currentPage = totalPage;
    }
    showCurrentPageNumber(title, currentPage);
    loadDataPerson(title, currentPage);
}

function loadDataPerson(title, currentPage) {
    var pageSize = getPageSize(title)
    var pageParams = getParams(currentPage, pageSize)
    var append = appendParams(title)
    var url = "operation4Person/list" + pageParams + "&key=" + title + append;
    ajaxRun(url, 0, "display" + title + "Div");
}

function countDataPerson(title) {
    var url = "operation4Person/count?key=" + title;
    var total = ajaxCalculate(url);
    return total;
}

function appendParams(title) {
    return "";
}

/*
* 统计函数
* */
function countPerson(title) {
    console.info(document.title + "+统计......");
    var append = setupAppendParamsPerson();
    var url = "operation4Person/count?key=" + title + append
    console.info(document.title + " : " + url);
    var total = ajaxCalculate(url);
    return total
}

/*
* 数据加载函数
* */
function loadPerson(title, page, pageSize) {
    console.info(document.title + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var append = setupAppendParamsPerson();
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var url = "operation4Person/list" + params + "&key=" + title + append;
    console.info(document.title + " : " + url);
    ajaxRun(url, 0, "list" + title + "Div");
}

function setupAppendParamsPerson() {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    return "";
}

/*
* 定位到需要编辑的记录
* */
function listToDo() {
    console.info(jsTitlePerson + "+待完成......");
    var title = jsTitlePerson;
    var page = 1;   //每次都定位到第一页
    var params = getParams(page, localPageSizePerson);    //getParams必须是放在最最前面！！
    ajaxRun("operation4Person/list" + params + "&key=" + title + ".TODO", 0, "list" + title + "Div");
}

function shiftDisplay(title) {
    console.info("显示当前提示...")
    $("#currentTemplate").html("下载[" + title + "]模板");
    $("#currentTemplate").attr("href", "operation4Person/downloadTemplate?key=" + title);
    $("#currentImport").html("导入[" + title + "]数据");
    $("#importKey").attr("value", title);
    $("#imputManual").html("手输[" + title + "]");
    switch (title) {
        case "教师":
            //$("#inputTeacher").style.display = "block";
            //$("#inputTeacher").className = ""; //不起作用
            $("#inputTeacher").attr("class", "")
            $("#inputStudent").attr("class", "hidden")
            console.info("----显示" + title);
            break
        case "学生":
            $("#inputTeacher").attr("class", "hidden")
            $("#inputStudent").attr("class", "")
            break
        default:
            $("#inputTeacher").attr("class", "hidden")
            $("#inputStudent").attr("class", "hidden")
    }
}

