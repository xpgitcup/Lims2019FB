/**
 * Created by LiXiaoping on 2017/1/12.
 */

/*
* storage的读取
* */
function readLocalStorage(cName, defaultValue) {
    var result = localStorage.getItem(cName)
    if (!result) {
        result = defaultValue
    }
    return result
}

/*
* storage的读取
* */
function readStorage(cName, defaultValue) {
    var result = sessionStorage.getItem(cName)
    if (!result) {
        result = defaultValue
    }
    return result
}

/*
* 对象数组查找
* */
function arrayFind(arrayToSearch, attr, value) {
    for (var i = 0; i < arrayToSearch.length; i++) {
        if (arrayToSearch[i][attr] == value) {
            return arrayToSearch[i];
        }
    }
    return null;
}

function arrayFindIndex(arrayToSearch, attr, value) {
    for (var i = 0; i < arrayToSearch.length; i++) {
        if (arrayToSearch[i][attr] == value) {
            return i;
        }
    }
    return -1;
}

/*
 * Cookie读取，如果有，就读取；如果没有，赋值为1
 * */
function readCookie(cName, defaultValue) {
    var result = $.cookie(cName);
    if (!result) {
        result = defaultValue;
    }
    return result
}

/*
 * 分页计算函数
 * */
function getParams(pageNumber, pageSize) {
    var offset
    if (pageNumber > 1) {
        offset = (pageNumber - 1) * pageSize
    } else {
        offset = 0
    }
    var params = "?offset=" + offset + "&max=" + pageSize
    return params
}

/*
 * 通用ajax函数，统计某个数值
 * */
function ajaxCall(url, data) {
    //console.info("开始计算--" + url);
    var result = 0;
    $.ajax({
        type: 'POST',
        url: url,
        data: {data: data},
        async: false,
        success: function (data, textStatus) {
            //console.info("ajax状态：" + textStatus);
            //console.info("ajax结果：" + data);
            //console.info("ajax结果：" + data.count);
            result = data;
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.info(XMLHttpRequest);
            console.info(textStatus);
            console.info(errorThrown);
        }
    });
    //console.info("返回的结果：" + result);
    return result;
}

/*
 * 通用ajax函数，统计某个数值
 * */
function ajaxCalculate(url) {
    //console.info("开始计算--" + url);
    var result = 0;
    $.ajax({
        type: 'POST',
        url: url,
        async: false,
        success: function (data, textStatus) {
            //console.info("ajax状态：" + textStatus);
            //console.info("ajax结果：" + data);
            //console.info("ajax结果：" + data.count);
            result = parseInt(data.count);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.info(XMLHttpRequest);
            console.info(textStatus);
            console.info(errorThrown);
        }
    });
    //console.info("返回的结果：" + result);
    return result;
}


/*
 * 通用ajax函数，统计某个数值
 * */
function ajaxRun4Json(url, jsFunction) {
    $.ajax({
        type: 'POST',
        url: url,
        async: false,
        success: function (data, textStatus) {
            var jsFunc = eval(jsFunction)
            jsFunc(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.info(XMLHttpRequest);
            console.info(textStatus);
            console.info(errorThrown);
        }
    });
}


/*
 * 通用的ajax执行函数
 * */
function ajaxRun(url, id, divId) {
    //console.info(url + '---' + id);
    //console.info("当前路径:" + window.location)
    if (id != null) {
        $.ajax({
            type: 'POST',
            url: url,
            data: {id: id},
            success: function (data, textStatus) {
                $('#' + divId).html(data);
                //console.info(data);   //调试用的
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.info(XMLHttpRequest);
                console.info(textStatus);
                console.info(errorThrown);
            }
        });
    } else {
        $.ajax({
            type: 'POST',
            url: url,
            success: function (data, textStatus) {
                $('#' + divId).html(data);
                //console.info(data);   //调试用的
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.info(XMLHttpRequest);
                console.info(textStatus);
                console.info(errorThrown);
            }
        });
    }
}

/*
 * 通用的ajax执行函数扩展
 * */
function ajaxRunEx(url, id, divId, nextFunction) {
    //console.info(url + '---' + id);
    //console.info("当前路径:" + window.location)
    var nextFunction = eval(nextFunction)
    if (id != null) {
        $.ajax({
            type: 'POST',
            url: url,
            data: {id: id},
            success: function (data, textStatus) {
                $('#' + divId).html(data);
                //console.info(data);   //调试用的
                nextFunction();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.info(XMLHttpRequest);
                console.info(textStatus);
                console.info(errorThrown);
            }
        });
    } else {
        $.ajax({
            type: 'POST',
            url: url,
            success: function (data, textStatus) {
                $('#' + divId).html(data);
                //console.info(data);   //调试用的
                nextFunction();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.info(XMLHttpRequest);
                console.info(textStatus);
                console.info(errorThrown);
            }
        });
    }
}

/*
* 只是执行
* */
function ajaxExecute(url) {
    //console.info("开始计算--" + url);
    var result = 0;
    $.ajax({
        type: 'POST',
        url: url,
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.info(XMLHttpRequest);
            console.info(textStatus);
            console.info(errorThrown);
        }
    });
}

/*
* 只是执行
* */
function ajaxExecuteWithMethod(url, method) {
    //console.info("开始计算--" + url);
    var result = 0;
    $.ajax({
        type: method,
        url: url,
        async: false,
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.info(XMLHttpRequest);
            console.info(textStatus);
            console.info(errorThrown);
        }
    });
}
