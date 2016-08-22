<%@ page import="br.gov.sus.sinasan.doacao.UnidadeHospitalar" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeHospitalar.label', default: 'UnidadeHospitalar')}" />

        <g:if test="${unidadeHospitalarInstance?.id}">
            <title><g:message code="default.edit.label" args="[entityName]" /></title>
        </g:if>
        <g:else>
            <title><g:message code="default.create.label" args="[entityName]" /></title>
        </g:else>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-unidadeHospitalar" class="content scaffold-edit" role="main">
			<h1>
                <g:if test="${unidadeHospitalarInstance?.id}">
                    <g:message code="default.edit.label" args="[entityName]" />
                </g:if>
                <g:else>
                    <g:message code="default.create.label" args="[entityName]" />
                </g:else>
            </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${unidadeHospitalarInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${unidadeHospitalarInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:unidadeHospitalarInstance, action:'salvar']" method="POST" >
				<g:hiddenField name="version" value="${unidadeHospitalarInstance?.version}" />
				<fieldset class="form">
					%{-- inicio do form --}%
					
					<div class="fieldcontain ${hasErrors(bean: unidadeHospitalarInstance, field: 'nome', 'error')} required">
						<label for="nome">
							<g:message code="unidadeHospitalar.nome.label" default="Nome" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="nome" required="" value="${unidadeHospitalarInstance?.nome}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: unidadeHospitalarInstance, field: 'endereco', 'error')} required">
						<label for="endereco">
							<g:message code="unidadeHospitalar.endereco.label" default="Endereco" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="endereco" required="" value="${unidadeHospitalarInstance?.endereco}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: unidadeHospitalarInstance, field: 'hospital', 'error')} required">
						<label for="hospital">
							<g:message code="unidadeHospitalar.hospital.label" default="Hospital" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="hospital" name="hospital.id" from="${br.gov.sus.sinasan.doacao.Hospital.list()}" optionKey="id" required="" value="${unidadeHospitalarInstance?.hospital?.id}" class="many-to-one"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: unidadeHospitalarInstance, field: 'municipio', 'error')} required">
						<label for="municipio">
							<g:message code="unidadeHospitalar.municipio.label" default="Municipio" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="municipio" name="municipio.id" from="${br.gov.sus.sinasan.doacao.Municipio.list()}" optionKey="id" required="" value="${unidadeHospitalarInstance?.municipio?.id}" class="many-to-one"/>

					</div>
					
					%{-- fim do form --}%
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="${unidadeHospitalarInstance?.id}">
                        <g:actionSubmit class="save" action="salvar" value="${message(code: 'default.button.update.label', default: 'Salvar')}" />
                    </g:if>
                    <g:else>
                        <g:actionSubmit class="save" action="salvar" value="${message(code: 'default.button.create.label', default: 'Criar')}" />
                    </g:else>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
