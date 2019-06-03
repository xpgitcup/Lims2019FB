//全局变量定义
var listLims2019EBDiv;
var Lims2019EBTabNames =["进度","登录","近7天进度","近7天登录"];
var localPageSizeLims2019EB;

$(function () {
    console.info("加载..." + document.title);

    //变量获取
    listLims2019EBDiv = $("#listLims2019EBDiv");
    var defaultTab = listLims2019EBDiv.tabs("tabs")[0].panel("options").title
    var currentTab = readStorage("current" + document.title, defaultTab);
    var localPageSizeLims2019EB = readLocalStorage("pageSize" + document.title, 5);
    console.info("首次加载..." + currentTab);

    listLims2019EBDiv.tabs({
        onSelect: function (title, index) {
            //记录tabs的缺省页面，所以采用tabsName
            console.info("选择标签：" + title + "--" + index);
            sessionStorage.setItem("current" + document.title, title);
            //------------------------------------------------------------------------------------------------------
            //记录当前页
            var cPageNumber = readStorage("currentPage" + document.title + title, 1);
            loadLims2019EB(title, cPageNumber, localPageSizeLims2019EB)
            // 设置翻页
            configPagination(title);
        }
    });
    // 打开缺省的标签
    listLims2019EBDiv.tabs("select", currentTab);

    var list进度Div = $("#list进度Div");
    var cPageNumber = readStorage("currentPage" + document.title + "进度", 1);
    console.info("panel首次加载.....")
    list进度Div.panel({
        href: loadLims2019EB("进度", cPageNumber, localPageSizeLims2019EB)
    })

    /*
    * 设置分页参数
    * */
    function configPagination(title) {
        var paginationDiv = $("#paginationLims2019EB" + title + "Div")
        var cPageNumber = readStorage("currentPage" + document.title + title, 1);
        var total = countLims2019EB(title)
        paginationDiv.pagination({
            pageSize: localPageSizeLims2019EB,
            total: total,
            pageList: [1, 3, 5, 10, 20, 30],
            showPageList: false,
            pageNumber: cPageNumber,
            onSelectPage: function (pageNumber, pageSize) {
                sessionStorage.setItem("currentPage" + document.title + title, pageNumber);     //记录当前页面
                loadLims2019EB(title, pageNumber, pageSize);
            }
        })
    }

});

/*
* 统计函数
* */
function countLims2019EB(title) {
    console.info(document.title + "+统计......");
    var append = setupAppendParamsLims2019EB();
    var url = "home/count?key=" + title + append
    console.info(document.title + " : " + url);
    var total = ajaxCalculate(url);
    return total
}

/*
* 数据加载函数
* */
function loadLims2019EB(title, page, pageSize) {
    console.info(document.title + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var append = setupAppendParamsLims2019EB();
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    var url = "home/list" + params + "&key=" + title + append;
    console.info(document.title + " : " + url);
    ajaxRun(url, 0, "list" + title + "Div");
}

function setupAppendParamsLims2019EB() {
    // 根据sessionStorage的参数，设置相应的附加参数，不同的标签的--都在各自页面考虑，所以不带参数
    return "-登录前";
}

function calculate() {

}