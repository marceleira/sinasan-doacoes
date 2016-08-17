<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />

        <g:if test="\${${propertyName}?.id}">
            <title><g:message code="default.edit.label" args="[entityName]" /></title>
        </g:if>
        <g:else>
            <title><g:message code="default.create.label" args="[entityName]" /></title>
        </g:else>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-${domainClass.propertyName}" class="content scaffold-edit" role="main">
			<h1>
                <g:if test="\${${propertyName}?.id}">
                    <g:message code="default.edit.label" args="[entityName]" />
                </g:if>
                <g:else>
                    <g:message code="default.create.label" args="[entityName]" />
                </g:else>
            </h1>
			<g:if test="\${flash.message}">
			<div class="message" role="status">\${flash.message}</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
			<ul class="errors" role="alert">
				<g:eachError bean="\${${propertyName}}" var="error">
				<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:${propertyName}, action:'salvar']" method="POST" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
				<g:hiddenField name="version" value="\${${propertyName}?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="\${${propertyName}?.id}">
                        <g:actionSubmit class="save" action="salvar" value="\${message(code: 'default.button.update.label', default: 'Salvar')}" />
                    </g:if>
                    <g:else>
                        <g:actionSubmit class="save" action="salvar" value="\${message(code: 'default.button.create.label', default: 'Criar')}" />
                    </g:else>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
