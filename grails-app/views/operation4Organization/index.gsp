<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="cn.edu.cup.basic.PersonTitle" contentType="text/html;charset=UTF-8" %>

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
    <g:set var="entityName" value="Organization"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/basic/${entityName}.js"/>
</head>

<body>

<div class="container-fluid m-0 p-0">
    <div class="row">
        <div class="col-12">
            <g:render template="groupInfoLeftPanel"/>
        </div>
    </div>

    <g:if test="${flash.message}">
        <div class="card">
            <div class="message" role="status">${flash.message}</div>
        </div>
    </g:if>
</div>

</body>
</html>
