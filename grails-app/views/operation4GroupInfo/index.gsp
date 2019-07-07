<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/7/5
  Time: 18:01
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
    <g:set var="entityName" value="GroupInfo"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/basic/${entityName}.js"/>
</head>

<body>

<div class="container-fluid">
    <!-- 设置查询 -->
    <ul id="query课题组UL" class="nav navbar bg-light">
        <li>
            <g:form controller="operation4GroupInfo" action="save" method="POST">
                <label>创建课题组</label>
                <label>领导</label>
                <g:select id="leader" name="groupInfo.leader" from="${cn.edu.cup.basic.Person.list()}" optionKey="id"
                          optionValue="name" noSelection="${['null': 'Select One...']}"/>
                <label>课题组名称</label>
                <input type="text" id="name" name="groupInfo.name" value=""/>
                <g:submitButton id="create" name="create" class="save"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </g:form>
        </li>
        <li><span class="form-inline">筛选:<div id="currentFilter课题组" class="text-danger">${keyString}</div></span></li>
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


    <div class="row">
        <div class="col-6">
            <g:render template="groupInfoPanel"/>
        </div>

        <div class="col-6">
            <div id="memberList" class="card">点击左边的某一行，显示课题组成员。</div>
        </div>
    </div>
</div>

</body>
</html>