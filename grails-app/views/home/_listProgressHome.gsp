<!DOCTYPE html>

<div id="list-progress" class="card">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${objectList.size() < 1}">
        请登录，并上报进度
    </g:if>
    <g:else>
        <!--f:table collection="${objectList}"/-->
        <table class="table table-striped table-ellipsis m-0 p-0">
            <thead>
            <th>前情</th>
            <th>状态</th>
            <th>贡献者</th>
            <th>问题</th>
            <th>支撑文件</th>
            <th>日期</th>
            </thead>
            <tbody>
            <g:each in="${objectList}" var="item" status="i">
                <tr class="${(i % 2 == 0 ? 'even' : 'odd')}">
                    <td>${item?.prevProgress?.currentStatus}</td>
                    <td>
                        ${item.currentStatus}
                    </td>
                    <td>${item.contributor}</td>
                    <td>${item.problemEncounter}</td>
                    <td>${item.supportFileName}</td>
                    <td>${item.regDate}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </g:else>
</div>
