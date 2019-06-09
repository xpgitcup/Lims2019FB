<!DOCTYPE html>

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
            <th>id</th>
            <th>前情</th>
            <th>状态</th>
            <th>项目</th>
            <th>贡献者</th>
            <th>问题</th>
            <th>支撑文件</th>
            <th>日期</th>
            </thead>
            <tbody>
            <g:each in="${objectList}" var="item" status="i">
                <tr class="${(i % 2 == 0 ? 'even' : 'odd')}">
                    <td>${item.id}</td>
                    <td><g:limitString source="${item?.prevProgress?.currentStatus}" length="14"></g:limitString></td>
                    <td>
                        ${item.currentStatus}
                        <a class="create" href="operation4Routine/create?preProgress=${item?.id}">上报/交流</a>
                    </td>
                    <td><g:limitString source="${item.team.thing}" length="16"></g:limitString></td>
                    <td>${item.contributor}</td>
                    <td>
                        <g:limitString length="20" source="${item.problemEncounter}"></g:limitString>
                    </td>
                    <td>
                        <g:limitString source="${item.supportFileName}" length="30"></g:limitString>
                    </td>
                    <td>
                        <g:limitString length="16" source="${item.regDate}"></g:limitString>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:else>
</div>
