<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="welcome"/>
    <title>登录</title>
</head>

<body>

<div class="login_title">
    ${cn.edu.cup.basic.Caption.findByName("main")?.title}
</div>

<form controller="home" action="login" method="post">
    <div class="welcomeForm">
        <ul>
            <li>
                <label>用户名</label>
                <g:textField name="userName" class="name"/>
            </li>
            <li>
                <label>密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                <g:field type="password" name="password" class="psw"/>
            </li>
        </ul>
        <ul>
            <li>
                <button type="submit" class="login-button">登录</button>
                <button type="reset" class="login-button">重置</button>
            </li>
        </ul>
    </div>
</form>

</body>
</html>
