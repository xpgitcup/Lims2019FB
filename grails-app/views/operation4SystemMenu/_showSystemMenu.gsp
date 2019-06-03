<div id="show-systemMenu" class="content scaffold-show" role="main">
    <h1>${entityName}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="systemMenu"/>
<!--g:form resource="${this.systemMenu}" method="DELETE"-->
    <g:form id="${this.systemMenu.id}" method="DELETE" action="delete" controller="operation4SystemMenu">
        <fieldset class="buttons">
            <!--g:link class="edit" action="edit" resource="${this.systemMenu}"-->
            <!--/g:link-->
            <a href="javascript: editSystemMenu(${this.systemMenu.id})">
                <g:message code="default.button.edit.label" default="Edit"/>
            </a>
            <input class="delete" type="submit"
                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                   onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
