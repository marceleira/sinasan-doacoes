
<%@ page import="br.gov.sus.sinasan.doacao.seguranca.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="usuario.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usuarioInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="usuario.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${usuarioInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="usuario.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${usuarioInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="usuario.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${usuarioInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="usuario.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${usuarioInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="usuario.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${usuarioInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.perfis}">
				<li class="fieldcontain">
					<span id="perfis-label" class="property-label"><g:message code="usuario.perfis.label" default="Perfis" /></span>
					
						<g:each in="${usuarioInstance.perfis}" var="p">
						<span class="property-value" aria-labelledby="perfis-label"><g:link controller="perfil" action="exibir" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:usuarioInstance, action:'excluir']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="editar" resource="${usuarioInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="excluir" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
