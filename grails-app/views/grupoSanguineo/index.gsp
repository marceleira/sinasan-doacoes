
<%@ page import="br.gov.sus.sinasan.doacao.GrupoSanguineo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grupoSanguineo.label', default: 'GrupoSanguineo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-grupoSanguineo" class="content_grails scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'grupoSanguineo.codigo.label', default: 'Codigo')}" />
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${grupoSanguineoInstanceList}" status="i" var="grupoSanguineoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${grupoSanguineoInstance.id}">${fieldValue(bean: grupoSanguineoInstance, field: "codigo")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination_grails">
				<g:paginate total="${grupoSanguineoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
