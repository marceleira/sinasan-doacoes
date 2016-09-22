
<%@ page import="br.gov.sus.sinasan.doacao.Doador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'doador.label', default: 'Doador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				%{--<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>--}%
				<br />
			</ul>
		</div>
		<div id="list-doador" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cpf" title="${message(code: 'doador.cpf.label', default: 'Cpf')}" />
					
						<g:sortableColumn property="nomeCompleto" title="${message(code: 'doador.nomeCompleto.label', default: 'Nome Completo')}" />
					
						<th><g:message code="doador.sexo.label" default="Sexo" /></th>
					
						<g:sortableColumn property="dataNascimento" title="${message(code: 'doador.dataNascimento.label', default: 'Data Nascimento')}" />
					
						<g:sortableColumn property="endereco" title="${message(code: 'doador.endereco.label', default: 'Endereco')}" />
					
						<g:sortableColumn property="telefone" title="${message(code: 'doador.telefone.label', default: 'Telefone')}" />
					
					</tr>

				</thead>
				<tbody>
				<g:each in="${doadorInstanceList}" status="i" var="doadorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="exibir" id="${doadorInstance.id}">${fieldValue(bean: doadorInstance, field: "cpf")}</g:link></td>
					
						<td>${fieldValue(bean: doadorInstance, field: "nomeCompleto")}</td>
					
						<td>${fieldValue(bean: doadorInstance, field: "sexo")}</td>
					
						<td><g:formatDate date="${doadorInstance.dataNascimento}" /></td>
					
						<td>${fieldValue(bean: doadorInstance, field: "endereco")}</td>
					
						<td>${fieldValue(bean: doadorInstance, field: "telefone")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${doadorInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
