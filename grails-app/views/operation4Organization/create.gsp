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
    <g:set var="entityName" value="${message(code: 'groupInfo.label', default: 'GroupInfo')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="card">
    <a href="#create-groupInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                      default="Skip to content&hellip;"/></a>
    <div id="create-groupInfo" class="content scaffold-create" role="main">
        <h1>创建小组</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.groupInfo}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.groupInfo}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form id="${this.groupInfo.id}" action="save" controller="${params.controller}" method="POST">
            <fieldset class="form">
                <f:all bean="groupInfo"/>
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
</div>
</body>
</html>
