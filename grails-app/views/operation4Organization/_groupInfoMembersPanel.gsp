<!--具体的课题组成员列表标签-->
<div id="card课题组成员列表Div" class="card" title="课题组成员列表">
    ${objectList}
    <div id="display课题组成员列表Div" class="card-body">
        <g:if test="${objectList?.size() > 0}">
            <table>
                <thead>

                </thead>
                <tbody>
                <g:each in="${objectList[0]}" var="item" status="i">
                    <tr>
                        <td>${item.code}</td>
                        <td>${item.name}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </g:if>
        <g:else>请选择课题组!</g:else>
    </div>
</div>
<!--具体的课题组成员列表标签结束======-->
