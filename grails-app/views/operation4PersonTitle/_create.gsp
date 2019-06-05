<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'personTitle.label', default: 'PersonTitle')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<div id="create-personTitle" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:form controller="operation4PersonTitle" action="save" method="POST">
        <g:hiddenField name="id" value="${this.personTitle?.id}"/>
        <g:hiddenField name="version" value="${this.personTitle?.version}"/>
        <fieldset class="form">
            <f:all bean="personTitle"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            <a href="operation4PersonTitle/index">返回</a>
        </fieldset>
    </g:form>
</div>
</body>
</html>
