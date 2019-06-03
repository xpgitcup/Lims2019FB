<nav class="breadcrumb m-0 p-0 bg-light">
    <g:if test="${currentMenuItem}">
        <div class="card">
            当前菜单：${currentMenuItem.menuContext}
        </div>
        <div class="pr-4"></div>
    </g:if>
    <g:if test="${currentMenuItem}">
        <a class="breadcrumb-item text-info"
           href="home/selectCurrentMenuItem?currentMenuItem=${currentMenuItem?.upMenuItem?.id}"
           style="color: yellow">返回上级</a>
    </g:if>
    <g:each in="${systemMenuList}" var="item" status="i">
        <g:if test="${item.menuAction == '#'}">
            <a class="breadcrumb-item"
               href="home/selectCurrentMenuItem?currentMenuItem=${item.id}">${item.menuContext}</a>
        </g:if>
        <g:else>
            <a class="breadcrumb-item" href="${item.menuAction}">${item.menuContext}</a>
        </g:else>
    </g:each>
</nav>
