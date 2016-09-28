
<%@ page import="br.gov.sus.sinasan.doacao.BolsaSangue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bolsaSangue.label', default: 'BolsaSangue')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				%{--<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>--}%
				<br />
			</ul>
		</div>
		<div id="list-bolsaSangue" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'bolsaSangue.codigo.label', default: 'Codigo')}" />
					
						<th><g:message code="bolsaSangue.grupoSanguineo.label" default="Grupo Sanguineo" /></th>

						<th><g:message code="bolsaSangue.situacaoBolsa.label" default="Situação da Bolsa" /></th>

						<th><g:message code="bolsaSangue.doacao.label" default="Doacao" /></th>
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${bolsaSangueInstanceList}" status="i" var="bolsaSangueInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${bolsaSangueInstance.id}">${fieldValue(bean: bolsaSangueInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: bolsaSangueInstance, field: "grupoSanguineo")}</td>

						<td>${fieldValue(bean: bolsaSangueInstance, field: "situacaoBolsa")}</td>

						<td>${fieldValue(bean: bolsaSangueInstance, field: "doacao")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bolsaSangueInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
