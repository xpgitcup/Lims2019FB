<!-- 设置查询 -->
<ul id="query登录后UL" class="nav navbar bg-light">
    <li><span class="form-inline">筛选:<div id="currentFilter登录后" class="text-danger">${keyString}</div></span></li>
    <li>
        <a href="javascript: clearFilterBootStrap()">清除筛选</a>
    </li>
    <li>
        <g:form onsubmit="return queryStatementBootStrap()">
            <label>关键字</label>
            <input type="text" id="keyString" name="keyString" value=""/>
            <input type="submit" name="查询" value="查询">
        </g:form>
    </li>
</ul>

<!-- 关于 登录后 的自动生成代码 -->
<div class="card" id="tabs登录后Div" title="登录后">
    <!-- 选项卡 -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a href="#div管理的项目" class="nav-link" data-toggle="tab">
                管理的项目
            </a>
        </li><li class="nav-item">
        <a href="#div领导的项目" class="nav-link" data-toggle="tab">
            领导的项目
        </a>
    </li><li class="nav-item">
        <a href="#div参与的项目" class="nav-link" data-toggle="tab">
            参与的项目
        </a>
    </li><li class="nav-item">
        <a href="#div领导的作业" class="nav-link" data-toggle="tab">
            领导的作业
        </a>
    </li><li class="nav-item">
        <a href="#div参与的作业" class="nav-link" data-toggle="tab">
            参与的作业
        </a>
    </li>
    </ul>

    <!-- 具体卡片-->
    <div class="tab-content">
        <!--具体的管理的项目标签-->
        <div id="div管理的项目" class="tab-pane">
            <div id="display管理的项目Div">
                <br> 在这里显示管理的项目所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome管理的项目"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('管理的项目')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('管理的项目')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome管理的项目"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome管理的项目"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('管理的项目')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('管理的项目')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome管理的项目"></a>
                </li>
            </ul>
        </div>
        <!--具体的管理的项目标签结束======-->
        <!--具体的领导的项目标签-->
        <div id="div领导的项目" class="tab-pane">
            <div id="display领导的项目Div">
                <br> 在这里显示领导的项目所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome领导的项目"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('领导的项目')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('领导的项目')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome领导的项目"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome领导的项目"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('领导的项目')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('领导的项目')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome领导的项目"></a>
                </li>
            </ul>
        </div>
        <!--具体的领导的项目标签结束======-->
        <!--具体的参与的项目标签-->
        <div id="div参与的项目" class="tab-pane">
            <div id="display参与的项目Div">
                <br> 在这里显示参与的项目所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome参与的项目"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('参与的项目')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('参与的项目')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome参与的项目"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome参与的项目"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('参与的项目')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('参与的项目')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome参与的项目"></a>
                </li>
            </ul>
        </div>
        <!--具体的参与的项目标签结束======-->
        <!--具体的领导的作业标签-->
        <div id="div领导的作业" class="tab-pane">
            <div id="display领导的作业Div">
                <br> 在这里显示领导的作业所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome领导的作业"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('领导的作业')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('领导的作业')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome领导的作业"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome领导的作业"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('领导的作业')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('领导的作业')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome领导的作业"></a>
                </li>
            </ul>
        </div>
        <!--具体的领导的作业标签结束======-->
        <!--具体的参与的作业标签-->
        <div id="div参与的作业" class="tab-pane">
            <div id="display参与的作业Div">
                <br> 在这里显示参与的作业所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome参与的作业"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('参与的作业')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('参与的作业')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome参与的作业"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome参与的作业"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('参与的作业')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('参与的作业')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome参与的作业"></a>
                </li>
            </ul>
        </div>
        <!--具体的参与的作业标签结束======-->

    </div>
</div>
<!--自动生成的代码结束-->