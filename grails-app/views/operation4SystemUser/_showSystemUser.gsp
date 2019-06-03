<g:set var="entityName" value="SystemUser"/>
<div id="show-systemUser" class="content scaffold-show" role="main">
    <h1>${entityName}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="systemUser"/>
<!--g:form resource="${this.systemUser}" method="DELETE"-->
    <g:form id="${this.systemUser?.id}" method="DELETE" action="delete" controller="operation4SystemUser">
        <fieldset class="buttons">
            <!--g:link class="edit" action="edit" resource="${this.systemUser}"-->
            <!--/g:link-->
            <a href="javascript: editSystemUser(${this.systemUser.id})">
                <g:message code="default.button.edit.label" default="Edit"/>
            </a>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
