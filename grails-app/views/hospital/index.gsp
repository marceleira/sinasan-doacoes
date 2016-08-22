
<%@ page import="br.gov.sus.sinasan.doacao.Hospital" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hospital.label', default: 'Hospital')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hospital" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'hospital.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'hospital.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="telefone" title="${message(code: 'hospital.telefone.label', default: 'Telefone')}" />
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${hospitalInstanceList}" status="i" var="hospitalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${hospitalInstance.id}">${fieldValue(bean: hospitalInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: hospitalInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: hospitalInstance, field: "telefone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hospitalInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
