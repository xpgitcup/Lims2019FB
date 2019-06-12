<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'teacher.label', default: 'Teacher')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-teacherTitle" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div id="list-teacherTitle" class="content scaffold-list" role="main">
    <table>
        <thead>
        <th>姓名</th>
        <th>工号</th>
        <th>职称</th>
        <th>领导</th>
        <th>参与</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    <a href="javascript: selectCurrentItem(${item.id})">${item.name}</a>
                    <a href="operation4Organization/create/?leader=${item.id}">创建小组</a>
                </td>
                <td>${item.code}</td>
                <td>${item.personTitle}</td>
                <td>${cn.edu.cup.basic.GroupInfo.countByLeader(item)}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>