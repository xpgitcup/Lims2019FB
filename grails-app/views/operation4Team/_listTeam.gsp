<%@ page import="cn.edu.cup.basic.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'team.label', default: 'Team')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-team" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div id="list-team" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <!--f:table collection="${objectList}"/-->
    <table>
        <thead>
        <th>id</th>
        <th>队长</th>
        <th>任务</th>
        <th>队员</th>
        <th>计划</th>
        <th>进度数</th>
        </thead>
        <g:if test="${objectList.size() < 1}">
            <div style="color: red">没有相关的团队！</div>
        </g:if>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2 == 0 ? 'even' : 'odd')}">
                <td>
                    <a href="team/show?id=${item.id}&nextController=operation4Team&nextAction=index">
                        ${item.id}
                    </a>
                </td>
                <td>
                    ${item.leader}
                    <a href="team/edit?id=${item.id}&nextController=operation4Team&nextAction=index">编辑</a>
                    <g:if test="${(item.progresses?.size() < 1) && (cn.edu.cup.lims.ProjectPlan.countByTeam(item) < 1)}">
                        <a href="javascript: deleteTeam(${item.id})">js删除</a>
                        <a href="operation4Team/delete?id=${item.id}&method=DELETE">删除</a>
                    </g:if>
                </td>
                <td>
                    ${item.thing}
                </td>
                <td>${item.members?.size()}</td>
                <td>${cn.edu.cup.lims.ProjectPlan.countByTeam(item)}</td>
                <td>
                    ${item.progresses?.size()}
                    <g:if test="${item.progresses?.size() < 1}">
                        <a href="">删除计划</a>
                    </g:if>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>