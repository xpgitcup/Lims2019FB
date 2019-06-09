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
    <g:set var="entityName" value="${message(code: 'progress.label', default: 'Progress')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<g:javascript>
    /*
    * 创建进度的时候，处理文件名
    * */
    function updateUploadFileName(fileName) {
        var aainput = document.getElementById("uploadedFile");
        $("#supportFileName").attr("value", aainput.files[0].name);
        console.info("所选择的文件：" + fileName);
        console.info(aainput.files[0].name)
    }
</g:javascript>

<div class="card">
    <div id="create-progress" class="content scaffold-create" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.progress}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.progress}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:uploadForm id="${this.progress.id}" action="save" controller="${params.controller}" method="POST">
            <fieldset class="form">
                <!--f:all bean="progress"/-->
                <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'prevProgress', 'error')} ">
                    <label for="prevProgress">
                        <g:message code="progress.prevProgress.label" default="前情回顾"/>
                    </label>
                    <g:textField name="prevProgress.id" value="${this.progress?.prevProgress?.id}"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'currentStatus', 'error')} required">
                    <label for="currentStatus">
                        <g:message code="progress.currentStatus.label" default="本次进展"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:textField name="currentStatus" required="" value="${this.progress?.currentStatus}"/>

                </div>

                <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'problemEncounter', 'error')} ">
                    <label for="problemEncounter">
                        <g:message code="progress.problemEncounter.label" default="发现的问题"/>

                    </label>
                    <g:textField name="problemEncounter" value="${this.progress?.problemEncounter}"/>

                </div>

                <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'supportFileName', 'error')} ">
                    <label for="supportFileName">
                        <g:message code="progress.supportFileName.label" default="支撑文件"/>
                    </label>
                    <!--g:textField name="supportFileName" value="${this.progress?.supportFileName}"/-->
                    <input type="text" name="supportFileName" id="supportFileName"
                           value="${this.progress?.supportFileName}"/>
                    <input type="file" name="uploadedFile" id="uploadedFile"
                           onchange="updateUploadFileName(this.value)"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'contributor', 'error')} required">
                    <label for="contributor">
                        <g:message code="progress.contributor.label" default="Contributor"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="contributor" name="contributor.id" from="${cn.edu.cup.basic.Person.list()}"
                              optionKey="id"
                              required="" value="${this.progress?.contributor?.id}" class="many-to-one"/>

                </div>

                <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'regDate', 'error')} required">
                    <label for="regDate">
                        <g:message code="progress.regDate.label" default="时间戳"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:datePicker name="regDate" value="${this.progress?.regDate}"/>
                </div>

                <div class="fieldcontain ${hasErrors(bean: this.progress, field: 'team', 'error')} required">
                    <label for="team">
                        <g:message code="progress.team.label" default="Team"/>
                        <span class="required-indicator">*</span>
                    </label>
                    <g:select id="team" name="team.id" from="${cn.edu.cup.lims.Team.list()}" optionKey="id" required=""
                              value="${this.progress?.team?.id}" class="many-to-one"/>

                </div>

                <!---------------->
                <g:hiddenField name="nextController" value="${params.nextController}"/>
                <g:hiddenField name="nextAction" value="${params.nextAction}"/>
                <g:hiddenField name="url" value=""/>
                <g:hiddenField name="needToDo" value="${params.needToDo}"/>
                <g:hiddenField name="currentProjectPlan" value="${params.currentProjectPlan}"/>
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="create" class="save"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </fieldset>
        </g:uploadForm>
    </div>

</div>
</body>
</html>
