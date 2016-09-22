
<%@ page import="br.gov.sus.sinasan.doacao.Doacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'doacao.label', default: 'Doacao')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				%{--<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>--}%
				<br />
			</ul>
		</div>
		<div id="list-doacao" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="doacao.unidadeLaboratorial.label" default="Unidade Laboratorial" /></th>
					
						<g:sortableColumn property="dataHoraAgendamento" title="${message(code: 'doacao.dataHoraAgendamento.label', default: 'Data Hora Agendamento')}" />
					
						<th><g:message code="doacao.doador.label" default="Doador" /></th>
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${doacaoInstanceList}" status="i" var="doacaoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${doacaoInstance.id}">${fieldValue(bean: doacaoInstance, field: "unidadeLaboratorial")}</g:link></td>
					
						<td><g:formatDate date="${doacaoInstance.dataHoraAgendamento}" /></td>
					
						<td>${fieldValue(bean: doacaoInstance, field: "doador")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${doacaoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
