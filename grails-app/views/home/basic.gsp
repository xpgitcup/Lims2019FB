<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/6/4
  Time: 8:34
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
    <title>底层维护</title>
</head>

<body>

<div class="card">
    <div id="controllers" role="navigation">
        <h2>Available Controllers:</h2>
        <ul class="nav navbar">
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                <li class="nav-item">
                    <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                </li>
            </g:each>
        </ul>
    </div>
</div>

</body>
</html>