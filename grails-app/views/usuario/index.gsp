
<%@ page import="br.gov.sus.sinasan.doacao.seguranca.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content_grails scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username')}" />

						<g:sortableColumn property="accountExpired" title="${message(code: 'usuario.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'usuario.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'usuario.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'usuario.passwordExpired.label', default: 'Password Expired')}" />
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>

						<td><g:formatBoolean boolean="${usuarioInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.passwordExpired}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination_grails">
				<g:paginate total="${usuarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
