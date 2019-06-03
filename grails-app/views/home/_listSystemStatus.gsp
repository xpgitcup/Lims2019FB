<!DOCTYPE html>
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
    <g:set var="entityName" value="${message(code: 'systemStatus.label', default: 'SystemStatus')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div id="list-systemStatus" class="card">
    <!--f:table collection="${objectList}"/-->
    <table class="table table-striped m-0 p-0">
        <thead>
        <th>用户名</th>
        <th>IP</th>
        <th>登录时间</th>
        <th>退出时间</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${i % 2 == 0 ? 'odd' : 'even'}">
                <td>${item.userName}</td>
                <td>${item.ip}</td>
                <td>${item.loginTime}</td>
                <td>${item.logoutTime}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>