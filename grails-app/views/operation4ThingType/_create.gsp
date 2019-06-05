<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'thingType.label', default: 'ThingType')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div id="create-thingType" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:form action="save" controller="${params.controller}" method="POST">
        <fieldset class="form">
            <f:all bean="thingType"/>
            <g:hiddenField name="id" value="${this.thingType.id}"/>
            <g:hiddenField name="nextController" value="${params.nextController}"/>
            <g:hiddenField name="nextAction" value="${params.nextAction}"/>
            <g:hiddenField name="url" value=""/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
