<div id="show-systemAttribute" class="content scaffold-show" role="main">
    <h1>${entityName}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="systemAttribute"/>
<!--g:form resource="${this.systemAttribute}" method="DELETE"-->
    <g:form id="${this.systemAttribute.id}" method="DELETE" action="delete" controller="operation4SystemAttribute">
        <fieldset class="buttons">
            <!--g:link class="edit" action="edit" resource="${this.systemAttribute}"-->
            <!--/g:link-->
            <a href="javascript: editSystemAttribute(${this.systemAttribute.id})">
                <g:message code="default.button.edit.label" default="Edit"/>
            </a>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
