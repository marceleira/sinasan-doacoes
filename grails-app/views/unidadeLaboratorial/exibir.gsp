
<%@ page import="br.gov.sus.sinasan.doacao.UnidadeLaboratorial" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeLaboratorial.label', default: 'UnidadeLaboratorial')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-unidadeLaboratorial" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list unidadeLaboratorial">

                <g:if test="${unidadeLaboratorialInstance?.codigo}">
                    <li class="fieldcontain">
                        <span id="codigo-label" class="property-label"><g:message code="unidadeLaboratorial.codigo.label" default="Código" /></span>

                        <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${unidadeLaboratorialInstance}" field="codigo"/></span>

                    </li>
                </g:if>

				<g:if test="${unidadeLaboratorialInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="unidadeLaboratorial.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${unidadeLaboratorialInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeLaboratorialInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="unidadeLaboratorial.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${unidadeLaboratorialInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeLaboratorialInstance?.laboratorio}">
				<li class="fieldcontain">
					<span id="laboratorio-label" class="property-label"><g:message code="unidadeLaboratorial.laboratorio.label" default="Laboratorio" /></span>
					
						<span class="property-value" aria-labelledby="laboratorio-label"><g:link controller="laboratorio" action="exibir" id="${unidadeLaboratorialInstance?.laboratorio?.id}">${unidadeLaboratorialInstance?.laboratorio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeLaboratorialInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="unidadeLaboratorial.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="exibir" id="${unidadeLaboratorialInstance?.municipio?.id}">${unidadeLaboratorialInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:unidadeLaboratorialInstance, action:'excluir']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="editar" resource="${unidadeLaboratorialInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="excluir" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
