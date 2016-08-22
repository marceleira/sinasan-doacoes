<%@ page import="br.gov.sus.sinasan.doacao.Laboratorio" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'laboratorio.label', default: 'Laboratorio')}" />

        <g:if test="${laboratorioInstance?.id}">
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
		<div id="edit-laboratorio" class="content scaffold-edit" role="main">
			<h1>
                <g:if test="${laboratorioInstance?.id}">
                    <g:message code="default.edit.label" args="[entityName]" />
                </g:if>
                <g:else>
                    <g:message code="default.create.label" args="[entityName]" />
                </g:else>
            </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${laboratorioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${laboratorioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:laboratorioInstance, action:'salvar']" method="POST" >
				<g:hiddenField name="version" value="${laboratorioInstance?.version}" />
				<fieldset class="form">
					%{-- inicio do form --}%
					
					<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'nome', 'error')} required">
						<label for="nome">
							<g:message code="laboratorio.nome.label" default="Nome" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="nome" maxlength="64" required="" value="${laboratorioInstance?.nome}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="laboratorio.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="email" name="email" maxlength="64" required="" value="${laboratorioInstance?.email}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'telefone', 'error')} required">
						<label for="telefone">
							<g:message code="laboratorio.telefone.label" default="Telefone" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="telefone" maxlength="16" required="" value="${laboratorioInstance?.telefone}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'unidades', 'error')} ">
						<label for="unidades">
							<g:message code="laboratorio.unidades.label" default="Unidades" />
							
						</label>
						
<ul class="one-to-many">
<g:each in="${laboratorioInstance?.unidades?}" var="u">
    <li><g:link controller="unidadeLaboratorial" action="exibir" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="unidadeLaboratorial" action="criar" params="['laboratorio.id': laboratorioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unidadeLaboratorial.label', default: 'UnidadeLaboratorial')])}</g:link>
</li>
</ul>


					</div>
					
					%{-- fim do form --}%
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="${laboratorioInstance?.id}">
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
