<%@ page import="br.gov.sus.sinasan.doacao.Estado" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />

        <g:if test="${estadoInstance?.id}">
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
		<div id="edit-estado" class="content scaffold-edit" role="main">
			<h1>
                <g:if test="${estadoInstance?.id}">
                    <g:message code="default.edit.label" args="[entityName]" />
                </g:if>
                <g:else>
                    <g:message code="default.create.label" args="[entityName]" />
                </g:else>
            </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${estadoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${estadoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:estadoInstance, action:'salvar']" method="POST" >
				<g:hiddenField name="version" value="${estadoInstance?.version}" />
				<fieldset class="form">
					%{-- inicio do form --}%
					
					<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'uf', 'error')} required">
						<label for="uf">
							<g:message code="estado.uf.label" default="Uf" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="uf" maxlength="2" required="" value="${estadoInstance?.uf}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nome', 'error')} required">
						<label for="nome">
							<g:message code="estado.nome.label" default="Nome" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="nome" required="" value="${estadoInstance?.nome}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'municipios', 'error')} ">
						<label for="municipios">
							<g:message code="estado.municipios.label" default="Municipios" />
							
						</label>
						
<ul class="one-to-many">
<g:each in="${estadoInstance?.municipios?}" var="m">
    <li><g:link controller="municipio" action="exibir" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="municipio" action="criar" params="['estado.id': estadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'municipio.label', default: 'Municipio')])}</g:link>
</li>
</ul>


					</div>
					
					%{-- fim do form --}%
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="${estadoInstance?.id}">
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
