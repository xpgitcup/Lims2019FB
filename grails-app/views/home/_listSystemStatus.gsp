<!DOCTYPE html>
<div class="content scaffold-list" role="main">
    <!--f:table collection="${objectList}"/-->
    <table>
        <thead>
        <th>用户名</th>
        <th>IP</th>
        <th>登录时间</th>
        <th>退出时间</th>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${i % 2 == 0 ? 'odd' : 'even'}">
                <td>${item.userName}</td>
                <td>${item.ip}</td>
                <td>${item.loginTime}</td>
                <td>${item.logoutTime}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
