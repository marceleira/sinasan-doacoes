<%@ page import="br.gov.sus.sinasan.doacao.Municipio" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municipio.label', default: 'Municipio')}" />

        <g:if test="${municipioInstance?.id}">
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
		<div id="edit-municipio" class="content scaffold-edit" role="main">
			<h1>
                <g:if test="${municipioInstance?.id}">
                    <g:message code="default.edit.label" args="[entityName]" />
                </g:if>
                <g:else>
                    <g:message code="default.create.label" args="[entityName]" />
                </g:else>
            </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${municipioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${municipioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:municipioInstance, action:'salvar']" method="POST" >
				<g:hiddenField name="version" value="${municipioInstance?.version}" />
				<fieldset class="form">
					%{-- inicio do form --}%
					
					<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nome', 'error')} required">
						<label for="nome">
							<g:message code="municipio.nome.label" default="Nome" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="nome" required="" value="${municipioInstance?.nome}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'estado', 'error')} required">
						<label for="estado">
							<g:message code="municipio.estado.label" default="Estado" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="estado" name="estado.id" from="${br.gov.sus.sinasan.doacao.Estado.list()}" optionKey="id" required="" value="${municipioInstance?.estado?.id}" class="many-to-one"/>

					</div>
					
					%{-- fim do form --}%
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="${municipioInstance?.id}">
                        <g:actionSubmit class="save" action="salvar" value="${message(code: 'default.button.update.label', default: 'Salvar')}" />
                    </g:if>
                    <g:else>
                        <g:actionSubmit class="save" action="salvar" value="${message(code: 'default.button.create.label', default: 'Criar')}" />
                    </g:else>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
