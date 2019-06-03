<table>
    <thead>
    <th>用户名</th>
    <th>用户属性</th>
    <th>附加属性</th>
    </thead>
    <tbody>
    <g:each in="${objectList}" status="i" var="item">
        <tr>
            <td>
                <a href="javascript: showSystemUser(${item.id})">
                    ${item.userName}
                </a>
            </td>
            <td>${item.roleAttribute}</td>
            <td>${item.appendAttribute}</td>
        </tr>
    </g:each>
    </tbody>
</table>
