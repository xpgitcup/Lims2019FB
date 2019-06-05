<%@ page import="cn.edu.cup.lims.ThingType" %>
<!DOCTYPE html>
<html>
<head>
<!-- 实现可定制的布局 -->
    <g:if test="${layout}">
        <meta name="layout" content="${layout}"/>
    </g:if>
    <g:else>
        <g:if test="${session.layout}">
            <meta name="layout" content="${session.layout}"/>
        </g:if>
        <g:else>
            <meta name="layout" content="main"/>
        </g:else>
    </g:else>
<!-- end 实现可定制的布局 -->
    <g:set var="entityName" value="${message(code: 'thingType.label', default: 'ThingType')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div id="show-thingType" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <div align="center">
        相关类型列表：${this.thingType.relatedThingTypeList()}
    </div>
    <hr>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="thingType"/>
    <g:form id="${this.thingType.id}" controller="${params.controller}" action="delete" method="DELETE">
        <fieldset class="buttons">

            <g:link class="edit" action="edit" id="${this.thingType.id}" controller="${params.controller}">
                <g:message code="default.button.edit.label" default="Edit"/>
            </g:link>
            <g:if test="${this.thingType.things?.size() < 1}">
                <input class="delete" type="submit"
                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </g:if>
            <g:else>
                <a>不能删除！项目：${this.thingType.things?.size()}，任务分配：${cn.edu.cup.lims.ThingTypeCircle.countByThingType(this.thingType)}</a>
            </g:else>
            <a>||</a>
            <g:if test="${ThingType.findByName("科研项目").bePartOf(thingType)}">
                <a class="create" href="javascript: createProject(${this.thingType.id})">创建科研项目</a>
            </g:if>
            <g:if test="${ThingType.findByName("教学任务").bePartOf(thingType)}">
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
