<%--
  Created by IntelliJ IDEA.
  User: LiXiaoping
  Date: 2019/5/27
  Time: 19:58
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<form action="/queryStatementA/update/3" method="post">
    <input type="hidden" name="_method" value="PUT" id="_method"/>
    <input type="hidden" name="version" value="1" id="version"/>

    <fieldset class="form">
        <div class='fieldcontain required'>
            <label for='controllerName'>Controller Name
                <span class='required-indicator'>*</span>
            </label><input type="text" name="controllerName" value="operation4Person" required="" id="controllerName"/>
        </div>

        <div class='fieldcontain required'>
            <label for='actionName'>Action Name
                <span class='required-indicator'>*</span>
            </label><input type="text" name="actionName" value="count" required="" id="actionName"/>
        </div>

        <div class='fieldcontain required'>
            <label for='keyString'>Key String
                <span class='required-indicator'>*</span>
            </label><input type="text" name="keyString" value="专业" required="" id="keyString"/>
        </div>

        <div class='fieldcontain'>
            <label for='formatString'>Format String</label><input type="text" name="formatString" value=""
                                                                  id="formatString"/>
        </div>

        <div class='fieldcontain'>
            <label for='paramsString'>Params String</label><input type="text" name="paramsString" value="[]"
                                                                  id="paramsString"/>
        </div>

        <div class='fieldcontain'>
            <label for='queryString'>Query String</label><input type="text" name="queryString"
                                                                value="select count(*) from Major major"
                                                                maxlength="1024"
                                                                id="queryString"/>
        </div>

        <div class='fieldcontain'>
            <label for='viewName'>View Name</label><input type="text" name="viewName" value="" id="viewName"/>
        </div>

        <div class='fieldcontain'>
            <label for='isSQL'>Is SQL</label><input type="hidden" name="_isSQL"/><input type="checkbox" name="isSQL"
                                                                                        id="isSQL"/>
        </div>

        <div class='fieldcontain'>
            <label for='needToQuery'>Need To Query</label><input type="hidden" name="_needToQuery"/><input
                type="checkbox"
                name="needToQuery"
                checked="checked"
                id="needToQuery"/>
        </div>
    </fieldset>

    <fieldset class="buttons">
        <input class="save" type="submit" value="Update"/>
    </fieldset>
</form>
</div>

</body>
</html>