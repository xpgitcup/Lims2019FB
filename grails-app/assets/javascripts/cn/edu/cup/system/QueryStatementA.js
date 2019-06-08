bootStrapPaginationSetting.identifier = "QueryStatementA"
bootStrapPaginationSetting.controller = "operation4QueryStatementA"

var card查询维护Div;

$(function(){
    console.info(document.title + "加载了...")
    card查询维护Div = $("#card查询维护Div");
    setupPagination4Card(card查询维护Div);
    loadCurrentPageBootStrap("查询维护")
})


/*
* 生成附加参数
* */
function appendParamsBootStrap(title) {
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
