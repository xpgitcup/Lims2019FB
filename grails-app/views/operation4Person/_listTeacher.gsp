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
        <th>学生</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    ${item.name}
                    <g:if test="${cn.edu.cup.system.SystemUser.countByUserName(item.code)>0}">
                        在职
                        <a href="operation4Person/removeFromSystemUser/?key=teacher&id=${item.id}">退休</a>
                    </g:if>
                    <g:else>
                        退休
                        <a href="operation4Person/addToSystemUser/?key=teacher&id=${item.id}">入职</a>
                    </g:else>
                </td>
                <td>${item.code}</td>
                <td>${item.personTitle}</td>
                <td>${item.students?.size()}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>