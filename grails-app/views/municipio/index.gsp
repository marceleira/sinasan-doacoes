
<%@ page import="br.gov.sus.sinasan.doacao.Municipio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municipio.label', default: 'Municipio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-municipio" class="content_grails scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'municipio.nome.label', default: 'Nome')}" />
					
						<th><g:message code="municipio.estado.label" default="Estado" /></th>
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${municipioInstanceList}" status="i" var="municipioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${municipioInstance.id}">${fieldValue(bean: municipioInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: municipioInstance, field: "estado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination_grails">
				<g:paginate total="${municipioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
