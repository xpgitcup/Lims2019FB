<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-teacherTitle" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div id="list-teacherTitle" class="content scaffold-list" role="main">
    <table>
        <thead>
        <th>姓名</th>
        <th>学号</th>
        <th>年级</th>
        <th>类型</th>
        <th>导师</th>
        <th>专业</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.name}</td>
                <td>
                    ${item.code}
                    <g:if test="${cn.edu.cup.system.SystemUser.countByUserName(item.code)>0}">
                        在读
                        <a href="operation4Person/removeFromSystemUser/?key=student&id=${item.id}">毕业</a>
                    </g:if>
                    <g:else>
                        毕业
                        <a href="operation4Person/addToSystemUser/?key=student&id=${item.id}">入学</a>
                    </g:else>
                </td>
                <td>
                    ${item.gradeName}
                    <g:if test="${cn.edu.cup.system.SystemUser.countByUserName(item.code)>0}">
                        在读
                        <a href="operation4Person/removeFromSystemUserGrade/?grade=${item.gradeName}">批量毕业</a>
                    </g:if>
                    <g:else>
                        毕业
                        <a href="operation4Person/addToSystemUserGrade/?grade=${item.gradeName}">批量入学</a>
                    </g:else>
                </td>
                <td>${item.personTitle}</td>
                <td>${item.supervisor}</td>
                <td>${item?.major}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>