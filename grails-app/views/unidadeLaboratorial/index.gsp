
<%@ page import="br.gov.sus.sinasan.doacao.UnidadeLaboratorial" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeLaboratorial.label', default: 'UnidadeLaboratorial')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unidadeLaboratorial" class="content_grails scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="nome" title="${message(code: 'unidadeLaboratorial.nome.label', default: 'Nome')}" />

						<th><g:message code="unidadeLaboratorial.laboratorio.label" default="Laboratorio" /></th>
					
						<th><g:message code="unidadeLaboratorial.municipio.label" default="Municipio" /></th>

						<g:sortableColumn property="codigo" title="${message(code: 'unidadeLaboratorial.codigo.label', default: 'Codigo')}" />
					</tr>

				</thead>
				<tbody>
				<g:each in="${unidadeLaboratorialInstanceList}" status="i" var="unidadeLaboratorialInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="exibir" id="${unidadeLaboratorialInstance.id}">${fieldValue(bean: unidadeLaboratorialInstance, field: "nome")}</g:link></td>

						<td>${fieldValue(bean: unidadeLaboratorialInstance, field: "laboratorio")}</td>
					
						<td>${fieldValue(bean: unidadeLaboratorialInstance, field: "municipio")}</td>

						<td>${fieldValue(bean: unidadeLaboratorialInstance, field: "codigo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination_grails">
				<g:paginate total="${unidadeLaboratorialInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
