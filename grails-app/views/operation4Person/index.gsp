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
    <g:set var="entityName" value="Person"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/basic/${entityName}.js"/>
</head>

<body>
<div class="container-fluid">
    <div class="card">
        <div class="card-header m-0 p-0">
            <ul id="operation4PersonUl" class="nav navbar bg-light">
                <li>
                    <a id="currentTemplate" href="">下载模板</a>
                </li>
                <li><a id="currentImport">导入数据</a></li>
                <li>
                    <g:uploadForm method="post" action="importFromFile">
                        <ul>
                            <li>
                                <input type="file" name="uploadedFile"/>
                            </li>
                            <li>
                                <input type="hidden" name="key" value="" id="importKey"/>
                            </li>
                            <li>
                                <input type="submit" value="ok">
                            </li>
                        </ul>
                    </g:uploadForm>
                </li>
            </ul>
        </div>

        <div class="card-body">
            <!-- 选项卡 -->
            <ul class="nav nav-tabs" role="tablist" title="人员数据">
                <li class="nav-item">
                    <a href="#div教师" class="nav-link" data-toggle="tab">
                        教师
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#div学生" class="nav-link" data-toggle="tab">
                        学生
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#div专业" class="nav-link" data-toggle="tab">
                        专业
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#div年级" class="nav-link" data-toggle="tab">
                        年级
                    </a>
                </li>
            </ul>

            <!-- 具体卡片-->
            <div class="tab-content">
                <!--具体的教师标签-->
                <div id="div教师" class="tab-pane">
                    <div id="display教师Div">
                        <br class="panel text-white" id="display教师Div">
                        <br> 在这里显示教师所需的信息</br>
                    </div>
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizePerson教师"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPersonFirstPage('教师')">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPersonPreviousPage('教师')">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPagePerson教师"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPagePerson教师"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPersonNextPage('教师')">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPersonLastPage('教师')">尾页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的教师标签结束======-->
                <!--具体的学生标签-->
                <div id="div学生" class="tab-pane">
                    <div id="display学生Div">
                        <br class="panel text-white" id="display学生Div">
                        <br> 在这里显示学生所需的信息</br>
                    </div>
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizePerson学生"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPersonFirstPage('学生')">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPersonPreviousPage('学生')">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPagePerson学生"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPagePerson学生"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPersonNextPage('学生')">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPersonLastPage('学生')">尾页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的学生标签结束======-->
                <!--具体的专业标签-->
                <div id="div专业" class="tab-pane">
                    <div id="display专业Div">
                        <br class="panel text-white" id="display专业Div">
                        <br> 在这里显示专业所需的信息</br>
                    </div>
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizePerson专业"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPersonFirstPage('专业')">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPersonPreviousPage('专业')">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPagePerson专业"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPagePerson专业"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPersonNextPage('专业')">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPersonLastPage('专业')">尾页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的专业标签结束======-->
                <!--具体的年级标签-->
                <div id="div年级" class="tab-pane">
                    <div id="display年级Div">
                        <br class="panel text-white" id="display年级Div">
                        <br> 在这里显示年级所需的信息</br>
                    </div>
                    <!-- 这里是分页设置-->
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a class="page-link">页长</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="pageSizePerson年级"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPersonFirstPage('年级')">首页</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: loadPersonPreviousPage('年级')">&laquo</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="currentPagePerson年级"></a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">/</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" id="totalPagePerson年级"></a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPersonNextPage('年级')">&raquo</a>
                        </li>
                        <li>
                            <a class="page-link" href="javascript: loadPersonLastPage('年级')">尾页</a>
                        </li>
                    </ul>
                </div>
                <!--具体的年级标签结束======-->

            </div>
        </div>
    </div>
</div>


<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

</body>
</html>
