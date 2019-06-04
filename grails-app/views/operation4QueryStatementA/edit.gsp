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
    <g:set var="entityName" value="${message(code: 'queryStatementA.label', default: 'QueryStatementA')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>

</head>

<body>

<div class="card">
    <div class="card-header">
        <h2>
            <g:message code="default.edit.label" args="[entityName]"/>
            ${this.queryStatementA.actionName}.${this.queryStatementA.keyString}
        </h2>
    </div>

    <div id="edit-queryStatementA" class="card-body">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.queryStatementA}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.queryStatementA}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form id="${this.queryStatementA.id}" action="update" controller="${params.controller}" method="PUT">
            <g:hiddenField name="version" value="${this.queryStatementA?.version}"/>

            <fieldset class="form">

                <div class='fieldcontain'>
                    <label for='paramsString'>Params String</label>
                    ${this.queryStatementA.paramsString}
                </div>

                <div class='fieldcontain'>
                    <label for='queryString'>Query String</label>
                    <g:textArea name="queryString" value="${this.queryStatementA.queryString}"
                                maxlength="1024" style="width:70em; rows:15"
                                id="queryString">
                    </g:textArea>
                </div>

                <div class='fieldcontain'>
                    <label for='viewName'>View Name</label>
                    <input type="text" name="viewName" width="50em"
                           value="${this.queryStatementA.viewName}"
                           id="viewName"/>
                </div>

                <div class='fieldcontain'>
                    <label for='isSQL'>Is SQL</label>
                    <input type="hidden" name="_isSQL"/>
                    <g:if test="${this.queryStatementA.isSQL}">
                        <input type="checkbox" name="isSQL" id="isSQL" checked="checked"/>
                    </g:if>
                    <g:else>
                        <input type="checkbox" name="isSQL" id="isSQL"/>
                    </g:else>
                </div>

                <div class='fieldcontain'>
                    <label for='needToQuery'>Need To Query</label>
                    <input type="hidden" name="_needToQuery"/>
                    <g:if test="${this.queryStatementA.needToQuery}">
                        <input type="checkbox" name="needToQuery" checked="checked" id="needToQuery"/>
                    </g:if>
                    <g:else>
                        <input type="checkbox" name="needToQuery" id="needToQuery"/>
                    </g:else>
                </div>
            </fieldset>

            <g:hiddenField name="nextController" value="${params.nextController}"/>
            <g:hiddenField name="nextAction" value="${params.nextAction}"/>

            <fieldset class="buttons">
                <input class="save" type="submit"
                       value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                <a href="operation4QueryStatementA/index">返回</a>
            </fieldset>
        </g:form>
    </div>
</div>

</body>
</html>
