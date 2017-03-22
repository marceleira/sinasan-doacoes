
<%@ page import="br.gov.sus.sinasan.doacao.BolsaSangue" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bolsaSangue.label', default: 'BolsaSangue')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bolsaSangue" class="content_grails scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bolsaSangue">
			
				<g:if test="${bolsaSangueInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="bolsaSangue.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${bolsaSangueInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bolsaSangueInstance?.grupoSanguineo}">
				<li class="fieldcontain">
					<span id="grupoSanguineo-label" class="property-label"><g:message code="bolsaSangue.grupoSanguineo.label" default="Grupo Sanguineo" /></span>
					
						<span class="property-value" aria-labelledby="grupoSanguineo-label"><g:link controller="grupoSanguineo" action="exibir" id="${bolsaSangueInstance?.grupoSanguineo?.id}">${bolsaSangueInstance?.grupoSanguineo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bolsaSangueInstance?.doacao}">
				<li class="fieldcontain">
					<span id="doacao-label" class="property-label"><g:message code="bolsaSangue.doacao.label" default="Doacao" /></span>
					
						<span class="property-value" aria-labelledby="doacao-label"><g:link controller="doacao" action="exibir" id="${bolsaSangueInstance?.doacao?.id}">${bolsaSangueInstance?.doacao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

                <g:if test="${bolsaSangueInstance?.situacaoBolsa}">
                    <li class="fieldcontain">
                        <span id="situacaoBolsa-label" class="property-label"><g:message code="bolsaSangue.situacaoBolsa.label" default="Situacao Bolsa" /></span>
                        <span class="property-value" aria-labelledby="situacaoBolsa-label">${bolsaSangueInstance?.situacaoBolsa?.encodeAsHTML()}</span>
                    </li>
                </g:if>

			</ol>
			<g:form url="[resource:bolsaSangueInstance, action:'excluir']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="editar" resource="${bolsaSangueInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="excluir" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
