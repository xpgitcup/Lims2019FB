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
    <g:set var="entityName" value="SystemMenu"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/system/${entityName}.js"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-3">
            <ul class="nav navbar bg-light">
                <li>
                    <a class="list">
                        系统菜单维护——(重新登录后，更新)
                    </a>
                </li>
            </ul>

            <div class="card">
                <!--div id="echartsSystemMenuDiv" style="height: 400px" title="菜单维护"></div-->
                <ul id="ztreeSystemMenuUl" class="ztree" title="菜单维护"></ul>
            </div>
        </div>

        <div class="col-9">
            <ul class="nav navbar bg-light">
                <li><a class="create" href="javascript: createSystemMenu(0)">新建根节点</a></li>
                <li><a id="createSystemMenu" class="create" href="#">新建子节点</a></li>
                <li><a id="exportSystemMenu"
                       href="operation4SystemMenu/exportToJsonFile?fileName=config/out/systemMenu.json"
                       class="save">导出Json文件</a></li>
            </ul>
            <div class="card">
                <div id="showSystemMenuDiv"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
