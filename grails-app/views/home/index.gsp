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

<div class="container-fluid">
    <g:render template="afterLogin${session.userStatus}"/>
</div>

</body>
</html>