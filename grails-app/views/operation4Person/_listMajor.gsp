<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'teacher.label', default: 'Major')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div id="list-teacher" class="content scaffold-list" role="main">
    <f:table collection="${objectList}"/>
</div>
</body>
</html>