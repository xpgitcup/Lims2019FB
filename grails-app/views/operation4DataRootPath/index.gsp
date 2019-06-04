<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/23
  Time: 11:04
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
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
    <g:set var="entityName" value="DataRootPath"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/system/${entityName}.js"/>
</head>

<body>

<div class="container-fluid">
    <ul id="operation4DataRootPathUl" class="nav navbar bg-light">
        <li class="nav-item">
        </li>
        <li  class="nav-item">
            <a href="operation4DataRootPath/exportToJsonFile?fileName=config/out/DataRootPath.json" class="save">导出Json文件</a>
        </li>
        <li  class="nav-item">
        </li>
    </ul>
</div>

<div class="container-fluid">
    <!-- 具体卡片-->
    <div class="card">
        <!--具体的数据根目录标签-->
        <div id="display数据根目录Div" class="card-body">
            <br> 在这里显示数据根目录所需的信息</br>
        </div>
        <div class="card-footer justify-content-center  m-0 pb-0">
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeDataRootPath数据根目录"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadDataRootPathPreviousPage('数据根目录')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageDataRootPath数据根目录"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageDataRootPath数据根目录"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadDataRootPathNextPage('数据根目录')">&raquo</a>
                </li>
            </ul>
        </div>
        <!--具体的数据根目录标签结束======-->
    </div>
</div>

<g:if test="${flash.message}">
    <div class="easyui-panel"><div class="message" role="status">${flash.message}</div></div>
</g:if>

</body>
</html>