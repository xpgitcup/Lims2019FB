<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<!--meta name="layout" content="main"/-->
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
    <g:set var="entityName" value="Person"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}</title>
    <asset:javascript src="cn/edu/cup/basic/${entityName}.js"/>
</head>

<body>
<div class="container-fluid">
    <div class="card">
        <ul id="operation4PersonUl" class="nav navbar bg-light p-0">
            <li>
                <div id="newPerson">
                    <g:form controller="operation4Person" action="save">
                        <ul>
                            <li>编号</li>
                            <li><input type="text" name="code"></li>
                            <li>姓名</li>
                            <li><input type="text" name="name"></li>
                            <li>类型</li>
                            <li>
                                <g:select from="${cn.edu.cup.basic.PersonTitle.list()}" name="personTitle"
                                          optionValue="name" optionKey="id">
                                </g:select>
                            </li>
                            <li>
                                <input type="submit" value="ok">
                            </li>
                        </ul>
                    </g:form>
                </div>
            </li>
        </ul>
    </div>

    <g:render template="personTabs"/>

    <g:if test="${flash.message}">
        <div class="card">
            <div class="message" role="status">${flash.message}</div>
        </div>
    </g:if>

</div>

</body>
</html>
