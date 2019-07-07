<asset:stylesheet src="cup/tableConfig.css"/>

<table class="table table-striped table-sm m-0 p-0">
    <thead>
    <th width="10%">名称</th>
    <th width="30%">组长</th>
    <th>人数</th>
    <th width="50%">招聘</th>
    </thead>
    <tbody>
    <g:each in="${objectList}" var="item" status="i">
        <tr onclick="javascript: showDetail(${item.id})">
            <td>
                ${item.name}
            </td>
            <td>${item.leader}</td>
            <td>${item.members?.size()}</td>
            <td>
                <g:form controller="operation4GroupInfo" action="recruit">
                    <label>姓名</label>
                    <g:textField name="name"></g:textField>
                    <g:hiddenField name="group" value="${item.id}"/>
                    <g:submitButton name="招募"></g:submitButton>
                </g:form>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
