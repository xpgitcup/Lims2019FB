var operation4QueryStatementDiv;
var jsTitleQueryStatement = "查询配置";
var title4QueryStatement = [jsTitleQueryStatement]
var localPageSizeQueryStatement = 5;

$(function () {
    console.info(jsTitleQueryStatement + "......");

    operation4QueryStatementDiv = $("#operation4QueryStatementDiv");
    var settings = {
        divId: operation4QueryStatementDiv,
        titles: title4QueryStatement,
        pageSize: localPageSizeQueryStatement,
        pageList: [1, 3, 5, 10],
        loadFunction: loadQueryStatement,
        countFunction: countQueryStatement
    }

    configDisplayUI(settings);
});

function deleteItem(id) {
    console.info("删除：" + id);
    ajaxExecuteWithMethod("operation4QueryStatement/delete?id=" + id, 'DELETE');
    console.info("删除：" + id + "了！");
    location.reload();
}

/*
* 查询
* */
function queryStatement() {
    var keyString = document.getElementById("keyString");
    //alert("查询..." + keyString.value);
    console.info("查询..." + keyString.value);
    $.cookie("filter", true);
    $.cookie("keyString", keyString.value);
    //$("#currentFilter").html(keyString.value);
    location.reload();
}

/*
* 定位到需要编辑的记录
* */
function listToDo() {
    console.info(jsTitleQueryStatement + "+待完成......");
    $.cookie("filter", true);
    location.reload();
}

/*
* 清除过滤条件
* */
function clearFilter() {
    $.cookie("filter", "");
    $.cookie("keyString", "");
    //$("#filter").html("待编辑&完成");
    console.info("?????清除....")
    //ajaxExecute("operation4QueryStatement/clearFilter") //不好使！！
    location.reload();
}

/*
* 附加参数
* */
function appendParam() {
    var filter = false
    filter = readCookie("filter", false);
    var keyString = readCookie("keyString", "")
    console.info("过滤状态：" + filter + " " + keyString);
    var param = ""
    if (filter) {
        if (keyString) {
            param = "&keyString=" + keyString;
            $("#currentFilter").html(keyString)
        } else {
            param = "&filter=true"
        }
    }
    console.info("附加参数：" + param);
    return param
}

/*
* 统计函数
* */
function countQueryStatement(title) {
    console.info(jsTitleQueryStatement + "+统计......");
    var total = ajaxCalculate("operation4QueryStatement/count?key=" + title + appendParam());
    return total
}

/*
* 数据加载函数
* */
function loadQueryStatement(title, page, pageSize) {
    console.info(jsTitleQueryStatement + "+数据加载......" + title + " 第" + page + "页/" + pageSize);
    var params = getParams(page, pageSize);    //getParams必须是放在最最前面！！
    ajaxRun("operation4QueryStatement/list" + params + "&key=" + title + appendParam(), 0, "list" + title + "Div");
}