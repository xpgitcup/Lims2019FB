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
    <g:render template="queryStatementAPanel"/>
    <g:render template="queryDebug"/>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel"><div class="message" role="status">${flash.message}</div></div>
</g:if>
</body>
</html>
