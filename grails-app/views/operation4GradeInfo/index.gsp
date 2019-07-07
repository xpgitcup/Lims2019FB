<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/7/5
  Time: 18:00
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
    <g:set var="entityName" value="GradeInfo"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/basic/${entityName}.js"/>
</head>

<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-6">
            <g:render template="gradeInfoPanel"/>
        </div>
        <div class="col-6">
            <div id="memberList">点击左边的某一行，显示课题组成员。</div>
        </div>
    </div>
</div>

</body>
</html>