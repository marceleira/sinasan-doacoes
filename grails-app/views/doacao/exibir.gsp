
<%@ page import="br.gov.sus.sinasan.doacao.Doacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'doacao.label', default: 'Doacao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-doacao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list doacao">
			
				<g:if test="${doacaoInstance?.unidadeLaboratorial}">
				<li class="fieldcontain">
					<span id="unidadeLaboratorial-label" class="property-label"><g:message code="doacao.unidadeLaboratorial.label" default="Unidade Laboratorial" /></span>
					
						<span class="property-value" aria-labelledby="unidadeLaboratorial-label"><g:link controller="unidadeLaboratorial" action="exibir" id="${doacaoInstance?.unidadeLaboratorial?.id}">${doacaoInstance?.unidadeLaboratorial?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${doacaoInstance?.dataHoraAgendamento}">
				<li class="fieldcontain">
					<span id="dataHoraAgendamento-label" class="property-label"><g:message code="doacao.dataHoraAgendamento.label" default="Data Hora Agendamento" /></span>
					
						<span class="property-value" aria-labelledby="dataHoraAgendamento-label"><g:formatDate date="${doacaoInstance?.dataHoraAgendamento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${doacaoInstance?.bolsasSangue}">
				<li class="fieldcontain">
					<span id="bolsasSangue-label" class="property-label"><g:message code="doacao.bolsasSangue.label" default="Bolsas Sangue" /></span>
					
						<g:each in="${doacaoInstance.bolsasSangue}" var="b">
						<span class="property-value" aria-labelledby="bolsasSangue-label"><g:link controller="bolsaSangue" action="exibir" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${doacaoInstance?.doador}">
				<li class="fieldcontain">
					<span id="doador-label" class="property-label"><g:message code="doacao.doador.label" default="Doador" /></span>
					
						<span class="property-value" aria-labelledby="doador-label"><g:link controller="doador" action="exibir" id="${doacaoInstance?.doador?.id}">${doacaoInstance?.doador?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:doacaoInstance, action:'excluir']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="editar" resource="${doacaoInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="excluir" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
