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
<!--这个地方设置成固定的-->
    <g:set var="entityName" value="Plan"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/lims/${entityName}.js"/>
</head>

<body>

<div class="container-fluid">
    <ul id="operation4PlanUl" class="nav navbar bg-light">
        <li class="icon-help">&nbsp&nbsp&nbsp&nbsp：</li>
        <li id="tipsOperation4Progress"></li>
        <li>当前：${planTitle}.${planJsRoutine}</li>
        <li id="currentTitle"></li>
        <li><a id="createItem"></a></li>
        <!--li><a id="editItem"></a></li-->
    </ul>

    <div class="row">
        <!--左面显示类型-->
        <div class="col-md-4">
            <div class="card">
                <ul id="ztreeThingTypeUl" class="ztree" title="项目类型"></ul>
            </div>
        </div>
        <!--右边显示计划-->
        <div class="col-md-8">
            <!-- 具体卡片-->
            <div class="card">
                <!--具体的通用计划标签-->
                <div id="display通用计划Div" class="card-body">
                    <br> 在这里显示通用计划所需的信息</br>
                </div>

                <div class="card-footer justify-content-center  m-0 pb-0">
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizePlan通用计划"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPlanFirstPage()">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPlanPreviousPage()">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPagePlan通用计划"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPagePlan通用计划"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPlanNextPage()">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPlanLastPage()">末页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的通用计划标签结束======-->
                <div class="card" id="operation4PlanItemDiv"></div>
            </div>
        </div>
    </div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel">
        <div class="message" role="status">${flash.message}</div>
    </div>
</g:if>

</body>
</html>
