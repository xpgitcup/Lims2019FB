<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<!--meta name="layout" content="main"/-->
<!-- 实现可定制的布局 -->
    <g:if test="${layout}">
        <meta name="layout" content="${layout}"/>
    </g:if>
    <g:else>
        <g:if test="${session.layout}">
            <meta name="layout" content="${session.layout}"/>
        </g:if>
        <g:else>
            <meta name="layout" content="main"/>
        </g:else>
    </g:else>
<!-- end 实现可定制的布局 -->
    <g:set var="entityName" value="QueryStatementA"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/system/${entityName}.js"/>
</head>

<body>

<div class="container-fluid m-0 p-0">
    <ul id="operation4QueryStatementUl" class="nav navbar bg-light">
        <li>
            <a href="operation4QueryStatementA/exportToJsonFileName?fileName=config/out/queryStatementS"
               class="save">阿里导出Json文件</a>
        </li>
        <li>
            <a href="operation4QueryStatementA/backup2file" class="save">备份SQL文件</a>
        </li>
        <!--li>
            <a href="operation4QueryStatementA/importFromJsonFile?fileName=config/queryStatement.json"
               class="create">从Json文件导入</a>
        </li-->
        <li>
            <a id="filter" href="javascript: listToDo()">待编辑&完成</a>
        </li>
        <li><span class="form-inline">筛选:<div id="currentFilter" class="text-danger">${keyString}</div></span></li>
        <li>
            <a href="javascript: clearFilter()">清除筛选</a>
        </li>
        <li>
            <g:form onsubmit="return queryStatement()">
                <label>关键字</label>
                <input type="text" id="keyString" name="keyString" value=""/>
                <input type="submit" name="查询" value="查询">
            </g:form>
        </li>
        <li>
            <g:form controller="operation4QueryStatementA" action="copyStatement">
                <label>源->目标id</label>
                <input type="text" id="sourceId" name="sourceId" value=""/>
                <input type="text" id="targetId" name="targetId" value=""/>
                <input type="submit" name="复制" value="复制">
            </g:form>
        </li>
    </ul>
</div>

<div class="container-fluid m-0 p-0">
    <!-- 具体卡片-->
    <div class="card">
        <!--具体的查询维护标签-->
        <div id="display查询维护Div" class="card-body">
            <br> 在这里显示查询维护所需的信息</br>
        </div>

        <div class="card-footer justify-content-center  m-0 pb-0">
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeQueryStatementA查询维护"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadQueryStatementAFirstPage()">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadQueryStatementAPreviousPage()">&laquo</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="currentPageQueryStatementA查询维护"></a>
                </li>
                <li class="page-item">
                    <a class="page-link">/</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalPageQueryStatementA查询维护"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadQueryStatementANextPage()">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadQueryStatementALastPage()">末页</a>
                </li>
            </ul>
        </div>
        <!--具体的查询维护标签结束======-->
    </div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel"><div class="message" role="status">${flash.message}</div></div>
</g:if>
</body>
</html>
