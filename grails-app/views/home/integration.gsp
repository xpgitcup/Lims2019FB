<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/6/4
  Time: 16:27
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
    <title>数据整合</title>
</head>

<body>
<div class="container-fluid">
    <div class="card">
        <h2>${sql}</h2>
        <table class="table table-striped m-0 p-0">
            <thead>
            <th>编号</th>
            <th>用户名</th>
            </thead>
            <tbody>
            <g:each in="${persons}" var="item" status="i">
                <tr class="${i % 2 == 0 ? 'odd' : 'even'}">
                    <td>${item.code}</td>
                    <td>${item.name}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>