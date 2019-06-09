<!DOCTYPE html>
<div class="card">
    <div>统计区间：${result.scope[0]}——${result.scope[1]}</div>
</div>
<div id="list-progress" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${objectList.size() < 1}">
        <a class="create" href="javascript: createCurrentProgress()">上报进度[${team}]</a>
    </g:if>
    <g:else>
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
    </g:else>
</div>
