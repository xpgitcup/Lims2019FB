<div id="list-plan" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <!--f:table collection="${objectList}" /-->
    <table>
        <thead>
        <th>项目名称</th>
        <th>日期</th>
        <th>详细信息</th>
        </thead>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2 == 0) ? 'even' : 'odd'}">
                <td>
                    ${item.description}
                    <g:if test="${item.subItems.size()<1}">
                        <a href="javascript: deleteItem(${item.id})">删除</a>
                    </g:if>
                    <a href="javascript: showItem(${item.id})">详细信息</a>
                    <a href="javascript: createPlanItem(${item.id})">创建计划项</a>
                </td>
                <td>${item.updateDate}</td>
                <td>${item.subItems.size()}</td>
            </tr>
        </g:each>
    </table>
</div>
