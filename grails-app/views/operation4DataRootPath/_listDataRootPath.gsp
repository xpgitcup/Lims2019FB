<!DOCTYPE html>
<div id="list-dataRootPath" class="table table-striped m-0 p-0" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${objectList}" />

    <div class="paginationGrails">
        <g:paginate total="${dataRootPathCount ?: 0}" />
    </div>
</div>
