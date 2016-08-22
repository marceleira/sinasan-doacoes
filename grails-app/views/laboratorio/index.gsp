
<%@ page import="br.gov.sus.sinasan.doacao.Laboratorio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'laboratorio.label', default: 'Laboratorio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-laboratorio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'laboratorio.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'laboratorio.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="telefone" title="${message(code: 'laboratorio.telefone.label', default: 'Telefone')}" />
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${laboratorioInstanceList}" status="i" var="laboratorioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${laboratorioInstance.id}">${fieldValue(bean: laboratorioInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: laboratorioInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: laboratorioInstance, field: "telefone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${laboratorioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
