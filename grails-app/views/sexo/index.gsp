
<%@ page import="br.gov.sus.sinasan.doacao.Sexo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sexo.label', default: 'Sexo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sexo" class="content_grails scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'sexo.codigo.label', default: 'Codigo')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'sexo.nome.label', default: 'Nome')}" />
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${sexoInstanceList}" status="i" var="sexoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${sexoInstance.id}">${fieldValue(bean: sexoInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: sexoInstance, field: "nome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination_grails">
				<g:paginate total="${sexoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
