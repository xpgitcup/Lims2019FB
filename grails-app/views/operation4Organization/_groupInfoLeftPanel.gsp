<!-- 设置查询 -->
<ul id="query课题组维护UL" class="nav navbar bg-light">
    <li><div id="currentFilter"></div></li>
    <li><span class="form-inline">筛选:<div id="currentFilter课题组维护" class="text-danger">${keyString}</div></span></li>
    <li>
        <a href="javascript: clearFilterBootStrap()">清除筛选</a>
    </li>
    <li>
        <g:form onsubmit="return queryStatementBootStrap(tabs课题组维护Div)">
            <label>关键字</label>
            <input type="text" id="keyString" name="keyString" value=""/>
            <input type="submit" name="查询" value="查询">
        </g:form>
    </li>
</ul>

<!-- 关于 课题组维护 的自动生成代码 -->
<div class="card" id="tabs课题组维护Div" title="课题组维护">
    <!-- 选项卡 -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a href="#div教师" class="nav-link" data-toggle="tab">
                教师
            </a>
        </li><li class="nav-item">
        <a href="#div课题组" class="nav-link" data-toggle="tab">
            课题组
        </a>
    </li>
    </ul>

    <!-- 具体卡片-->
    <div class="tab-content">
        <!--具体的教师标签-->
        <div id="div教师" class="tab-pane">
            <div id="display教师Div">
                <br> 在这里显示教师所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeGroupInfo教师"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('教师')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('教师')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageGroupInfo教师"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageGroupInfo教师"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('教师')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('教师')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountGroupInfo教师"></a>
                </li>
            </ul>
        </div>
        <!--具体的教师标签结束======-->
        <!--具体的课题组标签-->
        <div id="div课题组" class="tab-pane">
            <div id="display课题组Div">
                <br> 在这里显示课题组所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeGroupInfo课题组"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('课题组')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('课题组')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageGroupInfo课题组"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageGroupInfo课题组"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('课题组')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('课题组')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountGroupInfo课题组"></a>
                </li>
            </ul>
        </div>
        <!--具体的课题组标签结束======-->

    </div>
</div>
<!--自动生成的代码结束-->