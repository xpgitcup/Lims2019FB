<asset:stylesheet src="cup/tableConfig.css"/>

<table class="table table-striped table-sm m-0 p-0">
    <thead>
    <th width="5%">id</th>
    <th width="10%">Controller</th>
    <th width="5%">Action</th>
    <th width="5%">关键字</th>
    <th width="10%">参数</th>
    <th width="45%">查询</th>
    <th width="10%">视图</th>
    <th width="5%">执行</th>
    <th width="5%">isSQL</th>
    </thead>
    <tbody>
    <g:each in="${objectList}" var="item" status="i">
        <tr>
            <td>${item.id}</td>
            <td>
                <a href="operation4QueryStatementA/edit/${item.id}">${item.controllerName}</a>
                <a href="javascript: deleteItem(${item.id})">删除</a>
            </td>
            <td>${item.actionName}</td>
            <td>${item.keyString}</td>
            <td>${item.paramsString}</td>
            <td>
                ${item.queryString}
            </td>
            <td>${item.viewName}</td>
            <td>${item.needToQuery}</td>
            <td>${item.isSQL}</td>
        </tr>
    </g:each>
    </tbody>
</table>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
