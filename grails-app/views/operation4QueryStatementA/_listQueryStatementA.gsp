<table class="table table-striped table-sm m-0 p-0">
    <thead>
    <th>Controller</th>
    <th>Action</th>
    <th>关键字</th>
    <th>参数</th>
    <th>查询</th>
    <th>视图</th>
    <th>执行</th>
    <th>isSQL</th>
    </thead>
    <tbody>
    <g:each in="${objectList}" var="item" status="i">
        <tr>
            <td>
                <a href="operation4QueryStatementA/edit/${item.id}">${item.controllerName}</a>
                <a href="javascript: deleteItem(${item.id})">删除</a>
            </td>
            <td>${item.actionName}</td>
            <td>${item.keyString}</td>
            <td>${item.paramsString}</td>
            <td>
                <g:if test="${item.queryString?.length() > 90}">
                    ${item.queryString.substring(0, 90)}...
                </g:if>
                <g:else>
                    ${item.queryString}
                </g:else>
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
