<div id="list-plan" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
<!--f:table collection="${objectList}" /-->
    <table>
        <thead>
        <th>项目</th>
        <th>队长</th>
        <th>上级</th>
        <th>描述</th>
        <th>日期</th>
        <th>序号</th>
        </thead>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2 == 0) ? 'even' : 'odd'}">
                <td>
                    <g:limitString length="20" source="${item.team.thing}"></g:limitString>
                </td>
                <td>
                    <g:limitString length="12" source="${item.team.leader}"></g:limitString>
                </td>
                <td>
                    <g:limitString length="40" source="${item.upProjectPlan}"></g:limitString>
                </td>
                <td>
                    <g:limitString source="${item.description}" length="50"/>
                    <g:if test="${item.subItems.size() < 1}">
                        <a href="javascript: deleteItem(${item.id})">删除</a>
                    </g:if>
                </td>
                <td>
                    <g:limitString source="${item.updateDate}" length="10"></g:limitString>
                </td>
                <td>${item.subItems.size()}</td>
            </tr>
        </g:each>
    </table>
</div>
