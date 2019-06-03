<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/28
  Time: 13:42
--%>

<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!--设置布局模板-->
    <meta name="layout" content="mainCup20190407"/>
    %{--浏览器标签上的标题-kq--}%
    <title>${cn.edu.cup.basic.Caption.findByName("main")?.title}</title>
    %{--浏览器标签上的图标-kq--}%
    <asset:link rel="icon" href="cup/${cn.edu.cup.basic.Caption.findByName("main").logo}" type="image/x-ico"/>
    <!-- 设置标题，如果没有特殊情况，标题叫这样了。 -->
    <g:set var="entityName" value="Lims2019FA"/>
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/${entityName}.js"/>
</head>

<body>

<div class="container-fluid m-0 p-0">

    <!--第一行 -->
    <div class="row m-0 p-0">
        <div class="col-12">
            <div align="center">
                <div id="lims2019fa" class="carousel slide" data-ride="carousel">

                    <!-- 指示符 -->
                    <ul class="carousel-indicators">
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1"></li>
                        <li data-target="#demo" data-slide-to="2"></li>
                    </ul>

                    <!-- 轮播图片 -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName('公司1')?.logo}"/>
                        </div>

                        <div class="carousel-item">
                            <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName('公司2')?.logo}"/>
                        </div>

                        <div class="carousel-item">
                            <asset:image src="cup/${cn.edu.cup.basic.Caption.findByName('公司3')?.logo}"/>
                        </div>
                    </div>

                    <!-- 左右切换按钮 -->
                    <a class="carousel-control-prev" href="#lims2019fa" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </a>
                    <a class="carousel-control-next" href="#lims2019fa" data-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </a>

                </div>
            </div>
        </div>
    </div>

</div>

<!--第二行-->
<div class="container-fluid">

    <!-- 选项卡 -->
    <ul class="nav nav-tabs" role="tablist" title="登录前">
        <li class="nav-item">
            <a href="#div当前进度" class="nav-link" data-toggle="tab">
                当前进度
            </a>
        </li>
        <li class="nav-item">
            <a href="#div登陆情况" class="nav-link" data-toggle="tab">
                登陆情况
            </a>
        </li>
    </ul>

    <!-- 具体卡片-->
    <div class="tab-content">
        <!--具体的当前进度标签-->
        <div id="div当前进度" class="tab-pane">
            <div id="display当前进度Div">
                <br class="panel text-white" id="display当前进度Div">
                <br> 在这里显示当前进度所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome当前进度"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomeFirstPage('当前进度')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomePreviousPage('当前进度')">&laquo</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="currentPageHome当前进度"></a>
                </li>
                <li class="page-item">
                    <a class="page-link">/</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalPageHome当前进度"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeNextPage('当前进度')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeLastPage('当前进度')">尾页</a>
                </li>
            </ul>
        </div>
        <!--具体的当前进度标签结束======-->
        <!--具体的登陆情况标签-->
        <div id="div登陆情况" class="tab-pane">
            <div id="display登陆情况Div">
                <br class="panel text-white" id="display登陆情况Div">
                <br> 在这里显示登陆情况所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome登陆情况"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomeFirstPage('登陆情况')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadHomePreviousPage('登陆情况')">&laquo</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="currentPageHome登陆情况"></a>
                </li>
                <li class="page-item">
                    <a class="page-link">/</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalPageHome登陆情况"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeNextPage('登陆情况')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadHomeLastPage('登陆情况')">尾页</a>
                </li>
            </ul>
        </div>
        <!--具体的登陆情况标签结束======-->

    </div>

</div>

</body>

</html>