<!-- 设置查询 -->
<ul id="query登录前UL" class="nav navbar bg-light">
    <li><span class="form-inline">筛选:<div id="currentFilter登录前" class="text-danger">${keyString}</div></span></li>
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

<!-- 关于 登录前 的自动生成代码 -->
<div class="card" id="tabs登录前Div" title="登录前">
    <!-- 选项卡 -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a href="#div在研项目" class="nav-link" data-toggle="tab">
                在研项目
            </a>
        </li><li class="nav-item">
        <a href="#div全部项目" class="nav-link" data-toggle="tab">
            全部项目
        </a>
    </li><li class="nav-item">
        <a href="#div当前教学" class="nav-link" data-toggle="tab">
            当前教学
        </a>
    </li><li class="nav-item">
        <a href="#div全部教学" class="nav-link" data-toggle="tab">
            全部教学
        </a>
    </li><li class="nav-item">
        <a href="#div科研进展" class="nav-link" data-toggle="tab">
            科研进展
        </a>
    </li><li class="nav-item">
        <a href="#div教学进展" class="nav-link" data-toggle="tab">
            教学进展
        </a>
    </li><li class="nav-item">
        <a href="#div进展统计" class="nav-link" data-toggle="tab">
            进展统计
        </a>
    </li><li class="nav-item">
        <a href="#div登录统计" class="nav-link" data-toggle="tab">
            登录统计
        </a>
    </li>
    </ul>

    <!-- 具体卡片-->
    <div class="tab-content">
        <!--具体的在研项目标签-->
        <div id="div在研项目" class="tab-pane">
            <div id="display在研项目Div">
                <br> 在这里显示在研项目所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome在研项目"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('在研项目')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('在研项目')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome在研项目"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome在研项目"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('在研项目')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('在研项目')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome在研项目"></a>
                </li>
            </ul>
        </div>
        <!--具体的在研项目标签结束======-->
        <!--具体的全部项目标签-->
        <div id="div全部项目" class="tab-pane">
            <div id="display全部项目Div">
                <br> 在这里显示全部项目所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome全部项目"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('全部项目')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('全部项目')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome全部项目"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome全部项目"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('全部项目')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('全部项目')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome全部项目"></a>
                </li>
            </ul>
        </div>
        <!--具体的全部项目标签结束======-->
        <!--具体的当前教学标签-->
        <div id="div当前教学" class="tab-pane">
            <div id="display当前教学Div">
                <br> 在这里显示当前教学所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome当前教学"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('当前教学')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('当前教学')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome当前教学"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome当前教学"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('当前教学')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('当前教学')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome当前教学"></a>
                </li>
            </ul>
        </div>
        <!--具体的当前教学标签结束======-->
        <!--具体的全部教学标签-->
        <div id="div全部教学" class="tab-pane">
            <div id="display全部教学Div">
                <br> 在这里显示全部教学所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome全部教学"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('全部教学')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('全部教学')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome全部教学"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome全部教学"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('全部教学')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('全部教学')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome全部教学"></a>
                </li>
            </ul>
        </div>
        <!--具体的全部教学标签结束======-->
        <!--具体的科研进展标签-->
        <div id="div科研进展" class="tab-pane">
            <div id="display科研进展Div">
                <br> 在这里显示科研进展所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome科研进展"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('科研进展')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('科研进展')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome科研进展"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome科研进展"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('科研进展')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('科研进展')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome科研进展"></a>
                </li>
            </ul>
        </div>
        <!--具体的科研进展标签结束======-->
        <!--具体的教学进展标签-->
        <div id="div教学进展" class="tab-pane">
            <div id="display教学进展Div">
                <br> 在这里显示教学进展所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome教学进展"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('教学进展')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('教学进展')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome教学进展"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome教学进展"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('教学进展')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('教学进展')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome教学进展"></a>
                </li>
            </ul>
        </div>
        <!--具体的教学进展标签结束======-->
        <!--具体的进展统计标签-->
        <div id="div进展统计" class="tab-pane">
            <div id="display进展统计Div">
                <br> 在这里显示进展统计所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome进展统计"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('进展统计')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('进展统计')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome进展统计"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome进展统计"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('进展统计')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('进展统计')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome进展统计"></a>
                </li>
            </ul>
        </div>
        <!--具体的进展统计标签结束======-->
        <!--具体的登录统计标签-->
        <div id="div登录统计" class="tab-pane">
            <div id="display登录统计Div">
                <br> 在这里显示登录统计所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizeHome登录统计"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('登录统计')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('登录统计')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPageHome登录统计"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPageHome登录统计"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('登录统计')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('登录统计')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountHome登录统计"></a>
                </li>
            </ul>
        </div>
        <!--具体的登录统计标签结束======-->

    </div>
</div>
<!--自动生成的代码结束-->