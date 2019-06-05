<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'thingType.label', default: 'ThingType')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-thingType" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>
<div id="edit-thingType" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.thingType}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.thingType}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
<!--g:form resource="${this.thingType}" method="PUT"-->
    <g:form controller="operation4ThingType" action="update" id="${this.thingType?.id}" method="PUT">
        <g:hiddenField name="version" value="${this.thingType?.version}"/>
        <fieldset class="form">
            <f:all bean="thingType"/>
        </fieldset>
        <fieldset class="buttons">
            <input class="save" type="submit"
                   value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <a href="operation4ThingType/index">返回</a>
        </fieldset>
    </g:form>
</div>
</body>
</html>
