<%@ page import="br.gov.sus.sinasan.doacao.UnidadeLaboratorial" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeLaboratorial.label', default: 'UnidadeLaboratorial')}" />

        <g:if test="${unidadeLaboratorialInstance?.id}">
            <title><g:message code="default.edit.label" args="[entityName]" /></title>
        </g:if>
        <g:else>
            <title><g:message code="default.create.label" args="[entityName]" /></title>
        </g:else>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-unidadeLaboratorial" class="content_grails scaffold-edit" role="main">
			<h1>
                <g:if test="${unidadeLaboratorialInstance?.id}">
                    <g:message code="default.edit.label" args="[entityName]" />
                </g:if>
                <g:else>
                    <g:message code="default.create.label" args="[entityName]" />
                </g:else>
            </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${unidadeLaboratorialInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${unidadeLaboratorialInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:unidadeLaboratorialInstance, action:'salvar']" method="POST" >
				<g:hiddenField name="version" value="${unidadeLaboratorialInstance?.version}" />
				<fieldset class="form">
					%{-- inicio do form --}%
					
					<div class="fieldcontain ${hasErrors(bean: unidadeLaboratorialInstance, field: 'nome', 'error')} required">
						<label for="nome">
							<g:message code="unidadeLaboratorial.nome.label" default="Nome" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="nome" required="" value="${unidadeLaboratorialInstance?.nome}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: unidadeLaboratorialInstance, field: 'endereco', 'error')} required">
						<label for="endereco">
							<g:message code="unidadeLaboratorial.endereco.label" default="Endereco" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="endereco" required="" value="${unidadeLaboratorialInstance?.endereco}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: unidadeLaboratorialInstance, field: 'laboratorio', 'error')} required">
						<label for="laboratorio">
							<g:message code="unidadeLaboratorial.laboratorio.label" default="Laboratorio" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="laboratorio" name="laboratorio.id" from="${br.gov.sus.sinasan.doacao.Laboratorio.list()}" optionKey="id" required="" value="${unidadeLaboratorialInstance?.laboratorio?.id}" class="many-to-one"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: unidadeLaboratorialInstance, field: 'municipio', 'error')} required">
						<label for="municipio">
							<g:message code="unidadeLaboratorial.municipio.label" default="Municipio" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="municipio" name="municipio.id" from="${br.gov.sus.sinasan.doacao.Municipio.list()}" optionKey="id" required="" value="${unidadeLaboratorialInstance?.municipio?.id}" class="many-to-one"/>

					</div>
					
					%{-- fim do form --}%
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="${unidadeLaboratorialInstance?.id}">
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
