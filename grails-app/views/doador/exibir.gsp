
<%@ page import="br.gov.sus.sinasan.doacao.Doador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'doador.label', default: 'Doador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-doador" class="content_grails scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list doador">
			
				<g:if test="${doadorInstance?.cpf}">
				<li class="fieldcontain">
					<span id="cpf-label" class="property-label"><g:message code="doador.cpf.label" default="Cpf" /></span>
					
						<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${doadorInstance}" field="cpf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.nomeCompleto}">
				<li class="fieldcontain">
					<span id="nomeCompleto-label" class="property-label"><g:message code="doador.nomeCompleto.label" default="Nome Completo" /></span>
					
						<span class="property-value" aria-labelledby="nomeCompleto-label"><g:fieldValue bean="${doadorInstance}" field="nomeCompleto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="doador.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:link controller="sexo" action="exibir" id="${doadorInstance?.sexo?.id}">${doadorInstance?.sexo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.dataNascimento}">
				<li class="fieldcontain">
					<span id="dataNascimento-label" class="property-label"><g:message code="doador.dataNascimento.label" default="Data Nascimento" /></span>
					
						<span class="property-value" aria-labelledby="dataNascimento-label"><g:formatDate date="${doadorInstance?.dataNascimento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="doador.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${doadorInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.telefone}">
				<li class="fieldcontain">
					<span id="telefone-label" class="property-label"><g:message code="doador.telefone.label" default="Telefone" /></span>
					
						<span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${doadorInstance}" field="telefone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="doador.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${doadorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.naturalidade}">
				<li class="fieldcontain">
					<span id="naturalidade-label" class="property-label"><g:message code="doador.naturalidade.label" default="Naturalidade" /></span>
					
						<span class="property-value" aria-labelledby="naturalidade-label"><g:fieldValue bean="${doadorInstance}" field="naturalidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.nacionalidade}">
				<li class="fieldcontain">
					<span id="nacionalidade-label" class="property-label"><g:message code="doador.nacionalidade.label" default="Nacionalidade" /></span>
					
						<span class="property-value" aria-labelledby="nacionalidade-label"><g:fieldValue bean="${doadorInstance}" field="nacionalidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${doadorInstance?.doacoes}">
				<li class="fieldcontain">
					<span id="doacoes-label" class="property-label"><g:message code="doador.doacoes.label" default="Doacoes" /></span>
					
						<g:each in="${doadorInstance.doacoes}" var="d">
						<span class="property-value" aria-labelledby="doacoes-label"><g:link controller="doacao" action="exibir" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:doadorInstance, action:'excluir']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="editar" resource="${doadorInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="excluir" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
