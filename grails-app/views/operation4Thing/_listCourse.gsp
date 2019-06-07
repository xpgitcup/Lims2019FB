<%@ page import="cn.edu.cup.lims.Team" %>
<div id="list-teacher" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
<!--f:table collection="${objectList}"/-->
    <table>
        <thead>
        <th>名称</th>
        <th>教师</th>
        <th>学年</th>
        <th>类型</th>
        <th>相关人员</th>
        <td>相关进度</td>
        </thead>
        <tbody>
        <g:each in="${objectList}" var="item" status="i">
            <tr class="${(i % 2 == 0 ? 'even' : 'odd')}">
                <td>
                    ${item.name}
                    <g:if test="${cn.edu.cup.lims.Team.countByThing(item) < 1}">
                        <a href="javascript: deleteCourse(${item.id})">删除</a>
                    </g:if>
                    <g:else>
                        <a>不能删除，相关团队：${cn.edu.cup.lims.Team.countByThing(item)}，</a>
                    </g:else>
                    <a href="course/edit?id=${item.id}&nextController=operation4Thing&nextAction=index">编辑</a>
                </td>
                <td>${item.sponsor}</td>
                <td>${item.schoolYear}</td>
                <td>${item.thingType}</td>
                <td>${item.contacts.size()}</td>
                <td>${item.relatedProgress()}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>