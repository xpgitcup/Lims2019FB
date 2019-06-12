<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="cn.edu.cup.basic.PersonTitle" contentType="text/html;charset=UTF-8" %>

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
<div class="container-fluid m-0 p-0">
    <ul id="operation4PersonUl" class="nav navbar bg-light">
        <li>
            <div id="newTeacher">
                <g:form controller="operation4Person" action="save">
                    <ul>
                        <label>编号</label>
                        <input type="text" name="code">
                        <label>姓名</label>
                        <input type="text" name="name">
                        <lable>类型</lable>
                        <g:select
                                from="${cn.edu.cup.basic.PersonTitle.findAllByUpTitle(cn.edu.cup.basic.PersonTitle.findByName("教师"))}"
                                name="personTitle"
                                optionValue="name" optionKey="id">
                        </g:select>
                        <input type="submit" value="ok">
                    </ul>
                </g:form>
            </div>

            <div id="newStudent">
                <g:form controller="operation4Person" action="save">
                    <ul>
                        <label>编号</label>
                        <input type="text" name="code">
                        <label>姓名</label>
                        <input type="text" name="name">
                        <lable>类型</lable>
                        <g:textField value="${cn.edu.cup.basic.PersonTitle.findByName("本科生")}" name="personTitle">
                        </g:textField>
                        <input type="submit" value="ok">
                    </ul>
                </g:form>
            </div>

            <div id="newMaster">
                <g:form controller="operation4Person" action="save">
                    <ul>
                        <label>编号</label>
                        <input type="text" name="code">
                        <label>姓名</label>
                        <input type="text" name="name">
                        <lable>类型</lable>
                        <g:select
                                from="${cn.edu.cup.basic.PersonTitle.findAllByUpTitle(cn.edu.cup.basic.PersonTitle.findByName("研究生"))}"
                                name="personTitle"
                                optionValue="name" optionKey="id">
                        </g:select>
                        <input type="submit" value="ok">
                    </ul>
                </g:form>
            </div>
        </li>
        <li><span class="form-inline">筛选:<div id="currentFilter人员维护" class="text-danger">${keyString}</div></span></li>
        <li>
            <a href="javascript: clearFilterBootStrap()">清除筛选</a>
        </li>
        <li>
            <g:form onsubmit="return queryStatementBootStrap()">
                <label>关键字</label>
                <input type="text" id="keyString" name="keyString" value=""/>
                <input type="submit" name="查询" value="查询">
            </g:form>
        </li>
    </ul>
</div>

<div class="container-fluid m-0 p-0">
    <g:render template="personTabs"/>
    <g:if test="${flash.message}">
        <div class="card">
            <div class="message" role="status">${flash.message}</div>
        </div>
    </g:if>
</div>

</body>
</html>
