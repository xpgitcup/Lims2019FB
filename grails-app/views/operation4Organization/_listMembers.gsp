<g:if test="${groupInfo?.members.size() > 0}">
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
</g:if>
<g:else>请选择课题组!</g:else>
