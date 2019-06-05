<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'thingType.label', default: 'ThingType')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div id="show-thingType" class="content scaffold-show" role="main">
    相关类型列表：${this.thingType.relatedThingTypeList()}
<!--f:display bean="thingType"/-->
    <g:form id="${this.thingType.id}" controller="operation4ThingType" action="delete" method="DELETE">
        <fieldset class="buttons">
            <g:if test="${this.thingType.things?.size() < 1}">
                <input class="delete" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </g:if>
            <g:else>
                <a>不能删除！项目：${this.thingType.things?.size()}，任务分配：${cn.edu.cup.lims.ThingTypeCircle.countByThingType(this.thingType)}</a>
            </g:else>
            <a>||</a>
            <g:if test="${isProject}">
                <a class="create" href="javascript: createProject(${this.thingType.id})">创建科研项目</a>
            </g:if>
            <g:if test="${isCourse}">
                <a href="javascript: createCourse(${this.thingType.id})" class="create">创建教学任务</a>
            </g:if>
        </fieldset>
    </g:form>
    <table>
        <thead>
        <th>名称</th>
        </thead>
        <tbody>
        <g:each in="${this.thingType.things}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.name}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>
