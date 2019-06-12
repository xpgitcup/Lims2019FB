<!-- 设置查询 -->
<!--ul id="query人员维护UL" class="nav navbar bg-light">
    <li><span class="form-inline">筛选:<div id="currentFilter人员维护" class="text-danger">${keyString}</div></span></li>
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
</ul-->

<!-- 关于 人员维护 的自动生成代码 -->
<div class="card" id="tabs人员维护Div" title="人员维护">
    <!-- 选项卡 -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item">
            <a href="#div教师" class="nav-link" data-toggle="tab">
                教师
            </a>
        </li><li class="nav-item">
        <a href="#div本科生" class="nav-link" data-toggle="tab">
            本科生
        </a>
    </li><li class="nav-item">
        <a href="#div研究生" class="nav-link" data-toggle="tab">
            研究生
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
                    <a class="page-link" id="pageSizePerson教师"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('教师')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('教师')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPagePerson教师"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPagePerson教师"></a>
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
                    <a class="page-link" id="totalCountPerson教师"></a>
                </li>
            </ul>
        </div>
        <!--具体的教师标签结束======-->
        <!--具体的本科生标签-->
        <div id="div本科生" class="tab-pane">
            <div id="display本科生Div">
                <br> 在这里显示本科生所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizePerson本科生"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('本科生')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('本科生')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPagePerson本科生"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPagePerson本科生"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('本科生')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('本科生')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountPerson本科生"></a>
                </li>
            </ul>
        </div>
        <!--具体的本科生标签结束======-->
        <!--具体的研究生标签-->
        <div id="div研究生" class="tab-pane">
            <div id="display研究生Div">
                <br> 在这里显示研究生所需的信息</br>
            </div>
            <!-- 这里是分页设置-->
            <ul class="pagination pagination-sm">
                <li class="page-item">
                    <a class="page-link">页长</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="pageSizePerson研究生"></a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadFirstPageBootStrap('研究生')">首页</a>
                </li>
                <li class="page-item">
                    <a class="page-link" href="javascript: loadPreviousPageBootStrap('研究生')">&laquo</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="currentPagePerson研究生"></a>
                </li>
                <li class="page-item" >
                    <a class="page-link">/</a>
                </li>
                <li class="page-item" >
                    <a class="page-link" id="totalPagePerson研究生"></a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadNextPageBootStrap('研究生')">&raquo</a>
                </li>
                <li>
                    <a class="page-link" href="javascript: loadLastPageBootStrap('研究生')">尾页</a>
                </li>
                <li class="page-item">
                    <a class="page-link">总记录数</a>
                </li>
                <li class="page-item">
                    <a class="page-link" id="totalCountPerson研究生"></a>
                </li>
            </ul>
        </div>
        <!--具体的研究生标签结束======-->

    </div>
</div>
<!--自动生成的代码结束-->