
<%@ page import="br.gov.sus.sinasan.doacao.UnidadeHospitalar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeHospitalar.label', default: 'UnidadeHospitalar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-unidadeHospitalar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list unidadeHospitalar">

                <g:if test="${unidadeHospitalarInstance?.codigo}">
                    <li class="fieldcontain">
                        <span id="codigo-label" class="property-label"><g:message code="unidadeHospitalar.codigo.label" default="Código" /></span>

                        <span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${unidadeHospitalarInstance}" field="codigo"/></span>

                    </li>
                </g:if>

                <g:if test="${unidadeHospitalarInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="unidadeHospitalar.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${unidadeHospitalarInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeHospitalarInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="unidadeHospitalar.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${unidadeHospitalarInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeHospitalarInstance?.hospital}">
				<li class="fieldcontain">
					<span id="hospital-label" class="property-label"><g:message code="unidadeHospitalar.hospital.label" default="Hospital" /></span>
					
						<span class="property-value" aria-labelledby="hospital-label"><g:link controller="hospital" action="exibir" id="${unidadeHospitalarInstance?.hospital?.id}">${unidadeHospitalarInstance?.hospital?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeHospitalarInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="unidadeHospitalar.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="exibir" id="${unidadeHospitalarInstance?.municipio?.id}">${unidadeHospitalarInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:unidadeHospitalarInstance, action:'excluir']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="editar" resource="${unidadeHospitalarInstance}"><g:message code="default.button.edit.label" default="Editar" /></g:link>
					<g:actionSubmit class="delete" action="excluir" value="${message(code: 'default.button.delete.label', default: 'Excluir')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
