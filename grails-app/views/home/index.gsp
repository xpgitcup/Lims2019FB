<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/3
  Time: 14:22
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainCup20190407"/>
    <g:set var="entityName" value="HomeA"/>
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/os/${entityName}.js"/>
</head>

<body>

<div align="center" class="container-fluid">
    <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName("main详细介绍")?.logo}"/>
    <div class="row">

    </div>
</div>

<div class="container-fluid">
    <!-- 选项卡 -->
    <ul class="nav nav-tabs" role="tablist" title="登录后">
        <li class="nav-item">
            <a href="#div我的进展" class="nav-link" data-toggle="tab">
                我的进展
            </a>
        </li>
        <li class="nav-item">
            <a href="#div我的登录" class="nav-link" data-toggle="tab">
                我的登录
            </a>
        </li>
    </ul>

    <!-- 具体卡片-->
    <div class="tab-content">
        <!--具体的我的进展标签-->
        <div id="div我的进展" class="tab-pane">
            <div id="display我的进展Div">
                <br class="panel text-white" id="display我的进展Div">
                <br> 在这里显示我的进展所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome我的进展"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomeFirstPage('我的进展')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomePreviousPage('我的进展')">&laquo</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="currentPageHome我的进展"></a>
                </li>
                <li class="page-item">
                    <a class="page-link">/</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalPageHome我的进展"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeNextPage('我的进展')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeLastPage('我的进展')">尾页</a>
                </li>
            </ul>
        </div>
        <!--具体的我的进展标签结束======-->
        <!--具体的我的登录标签-->
        <div id="div我的登录" class="tab-pane">
            <div id="display我的登录Div">
                <br class="panel text-white" id="display我的登录Div">
                <br> 在这里显示我的登录所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome我的登录"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomeFirstPage('我的登录')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomePreviousPage('我的登录')">&laquo</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="currentPageHome我的登录"></a>
                </li>
                <li class="page-item">
                    <a class="page-link">/</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalPageHome我的登录"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeNextPage('我的登录')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeLastPage('我的登录')">尾页</a>
                </li>
            </ul>
        </div>
        <!--具体的我的登录标签结束======-->

    </div>

</div>

</body>
</html>