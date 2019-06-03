<%--
  Created by IntelliJ IDEA.
  User: LiXiaopingChuyun
  Date: 2019/4/13
  Time: 9:10
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="welcome"/>
    <title>修改密码</title>
</head>

<body>

<div class="login_title">
    ${cn.edu.cup.basic.Caption.findByName("main")?.title}
</div>

<form controller="home" action="changePassword" method="post">
    <div class="welcomeForm">
        <ul>
            <li>
                <label>原密码</label>
                <g:field type="password" name="oldPassword" class="psw"/>
            </li>
            <li>
                <label>新密码</label>
                <g:field type="password" name="newPassword" class="psw"/>
            </li>
            <li>
                <label>再确认</label>
                <g:field type="password" name="rePassword" class="psw"/>
            </li>
        </ul>
        <ul>
            <li>
                <button type="submit" class="login-button">确定</button>
                <button type="reset" class="login-button">重置</button>
            </li>
        </ul>
    </div>
</form>

<g:if test="${flash}">
    <div class="changepassword">
        <h2>${flash.message}</h2>
    </div>
</g:if>

</body>
</html>