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
        <th>任务类型</th>
        <th>队员</th>
        <th>计划</th>
        </thead>
        <g:if test="${objectList.size() < 1}">
            <div style="color: red">没有相关的团队！</div>
        </g:if>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2 == 0 ? 'even' : 'odd')}">
                <td>
                    <a href="operation4Routine/create?team=${item.id}">
                        ${item.id}
                        上传进度
                    </a>
                </td>
                <td>
                    ${item.leader}
                </td>
                <td>${item.thing}</td>
                <td>${item.thing.thingType}</td>
                <td>${item.members?.size()}</td>
                <td>${cn.edu.cup.lims.ProjectPlan.countByTeam(item)}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>