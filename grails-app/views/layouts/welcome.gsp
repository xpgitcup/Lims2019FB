<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- 界面设置开始 -->
    <asset:stylesheet src="application.css"/>

    <!--引入CUP的相关内容-->
    <asset:stylesheet src="cup/welcome.css"/>

    <!-- 界面设置结束 -->

    <g:layoutHead/>
</head>

<body>
<div class="container">
    <div class="welcomePanel">
        %{--页面正文--}%
        <g:layoutBody/>
    </div>
</div>

<!--asset:javascript src="application.js"/-->

</body>
</html>
