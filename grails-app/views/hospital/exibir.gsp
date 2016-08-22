
<%@ page import="br.gov.sus.sinasan.doacao.Hospital" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hospital.label', default: 'Hospital')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hospital" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hospital">
			
				<g:if test="${hospitalInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="hospital.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${hospitalInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hospitalInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="hospital.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${hospitalInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hospitalInstance?.telefone}">
				<li class="fieldcontain">
					<span id="telefone-label" class="property-label"><g:message code="hospital.telefone.label" default="Telefone" /></span>
					
						<span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${hospitalInstance}" field="telefone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hospitalInstance?.unidades}">
				<li class="fieldcontain">
					<span id="unidades-label" class="property-label"><g:message code="hospital.unidades.label" default="Unidades" /></span>
					
						<g:each in="${hospitalInstance.unidades}" var="u">
						<span class="property-value" aria-labelledby="unidades-label"><g:link controller="unidadeHospitalar" action="exibir" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:hospitalInstance, action:'excluir']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="editar" resource="${hospitalInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="excluir" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
