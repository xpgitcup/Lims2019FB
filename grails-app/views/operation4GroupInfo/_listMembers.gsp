<div class="card">
    <g:if test="${groupInfo?.members?.size() > 0}">
        <div class="card-header">课题组：${groupInfo.name}</div>

        <div class="card-body">
            <table>
                <thead>
                <th>姓名</th>
                <th>编号</th>
                </thead>
                <tbody>
                <g:each in="${groupInfo?.members}" var="item" status="i">
                    <tr>
                        <td>${item.code}</td>
                        <td>${item.name}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </g:if>
    <g:else>
        <div class="card-body">
            还没有招募人员!
        </div>
    </g:else>
</div>
