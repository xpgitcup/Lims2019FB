<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'teacher.label', default: 'GradeName')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div id="list-teacher" class="content scaffold-list" role="main">
    <!--f:table collection="${objectList}"/-->
    <table>
        <thead>
        <th>年级</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.grade_name}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

</div>
</body>
</html>