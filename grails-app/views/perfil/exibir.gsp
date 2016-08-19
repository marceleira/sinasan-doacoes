
<%@ page import="br.gov.sus.sinasan.doacao.seguranca.Perfil" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'perfil.label', default: 'Perfil')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-perfil" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list perfil">
			
				<g:if test="${perfilInstance?.authority}">
				<li class="fieldcontain">
					<span id="authority-label" class="property-label"><g:message code="perfil.authority.label" default="Authority" /></span>
					
						<span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${perfilInstance}" field="authority"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:perfilInstance, action:'excluir']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="editar" resource="${perfilInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="excluir" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
