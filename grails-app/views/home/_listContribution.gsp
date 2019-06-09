<!DOCTYPE html>

<div class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
<!--f:table collection="${objectList}"/-->
    <table>
        <thead>
        <th>编号</th>
        <th>姓名</th>
        <th>贡献</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2 == 0 ? 'even' : 'odd')}">
                <td>${item.code}</td>
                <td>${item.name}</td>
                <td>${item.cc}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
