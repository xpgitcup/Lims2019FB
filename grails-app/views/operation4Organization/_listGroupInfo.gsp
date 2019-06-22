<div class="row">

    <div class="col-6">
        <table>
            <thead>
            <th>名称</th>
            <Th>队长</Th>
            <th>人数</th>
            <th>招募</th>
            </thead>
            <tbody>
            <g:if test="${objectList.size() < 1}">
                <tr><td>尚未创建课题组！</td></tr>
            </g:if>
            <g:each in="${objectList}" var="item" status="i">
                <tr>
                    <td>
                        <a href="javascript: selectCurrentItem('${item.name}')">${item.name}</a>
                    </td>
                    <td>
                        ${item.leader}
                        <a href="javascript: showDetail(${item.id})">详情</a>
                    </td>
                    <td>${item.members?.size()}</td>
                    <td>
                        <g:form controller="operation4Organization" action="recruit">
                            <label>姓名</label>
                            <g:textField name="name"></g:textField>
                            <g:hiddenField name="group" value="${item.id}"/>
                            <g:submitButton name="招募"></g:submitButton>
                        </g:form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="col-6">
        <div class="card">
            <div class="card-header">

            </div>

            <div class="card-body">
                <table>
                    <thead>
                    <th>编号</th>
                    <th>姓名</th>
                    </thead>
                    <tbody>
                    <g:each in="${objectList[0]?.members}" var="item" status="i">
                        <tr>
                            <td>${item.code}</td>
                            <td>${item.name}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
