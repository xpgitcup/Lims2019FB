<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/6/4
  Time: 16:27
--%>

<%@ page import="cn.edu.cup.lims.Thing; cn.edu.cup.lims.Team" contentType="text/html;charset=UTF-8" %>
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
            <th>操作</th>
            <th>结果</th>
            </thead>
            <tbody>
            <tr>
                <td><a href="#">同步进度</a></td>
                <td>当前团队：${cn.edu.cup.lims.Progress.count()}</td>
            </tr>
            <tr>
                <td><a href="database/importTeamMember">队员导入</a></td>
                <td>当前团队：${cn.edu.cup.lims.Team.count()}</td>
            </tr>
            <tr>
                <td><a href="#">人员导入</a></td>
                <td>当前人员：${cn.edu.cup.basic.Person.count()}</td>
            </tr>
            <tr>
                <td><a href="database/importThing">事情导入</a></td>
                <td>当前事情：${cn.edu.cup.lims.Thing.count()}</td>
            </tr>
            <tr>
                <td><a href="database/importTeam">团队导入</a></td>
                <td>当前团队：${cn.edu.cup.lims.Team.count()}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>