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
    <g:set var="entityName" value="SystemUser"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/system/${entityName}.js"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-6 column">
            <ul class="nav navbar bg-light">
                <li>
                    <a class="list">
                        系统用户维护——(重新登录后，更新)
                    </a>
                </li>
            </ul>
            <!-- 具体卡片-->
            <div class="card">
                <!--具体的用户维护标签-->
                <div id="display用户维护Div" class="card-body">
                    <br> 在这里显示用户维护所需的信息</br>
                </div>

                <div class="card-footer justify-content-center  m-0 pb-0">
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizeSystemUser用户维护"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadSystemUserFirstPage()">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadSystemUserPreviousPage()">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPageSystemUser用户维护"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPageSystemUser用户维护"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadSystemUserNextPage()">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadSystemUserLastPage()">末页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的用户维护标签结束======-->
            </div>
        </div>

        <div class="col-6 column">
            <ul class="nav navbar bg-light">
                <li><a class="create" href="javascript: createSystemUser(0)">新建</a></li>
                <li><a class="save"
                       href="operation4SystemUser/exportToJsonFile?fileName=config/out/systemUser.json">导出Json文件</a>
                </li>
                <li>
                    <a href="javascript: clearFilter()">清除</a>
                </li>
                <li>筛选</li>
                <li id="currentFilter" style="color: red">${keyString}</li>
                <li>
                    <g:form onsubmit="return querySystemUser()">
                        <label>姓名（附加属性）</label>
                        <input type="text" id="keyString" name="keyString" value=""/>
                        <input type="submit" name="查询" value="查询">
                    </g:form>
                </li>
            </ul>

            <div class="card">
                <div id="showSystemUserDiv"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
