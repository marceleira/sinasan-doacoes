<%@ page import="br.gov.sus.sinasan.doacao.seguranca.Usuario" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />

        <g:if test="${usuarioInstance?.id}">
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
		<div id="edit-usuario" class="content scaffold-edit" role="main">
			<h1>
                <g:if test="${usuarioInstance?.id}">
                    <g:message code="default.edit.label" args="[entityName]" />
                </g:if>
                <g:else>
                    <g:message code="default.create.label" args="[entityName]" />
                </g:else>
            </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${usuarioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${usuarioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:usuarioInstance, action:'salvar']" method="POST" >
				<g:hiddenField name="version" value="${usuarioInstance?.version}" />
				<fieldset class="form">
					%{-- inicio do form --}%
					
					<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
						<label for="username">
							<g:message code="usuario.username.label" default="Username" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="username" required="" value="${usuarioInstance?.username}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
						<label for="password">
							<g:message code="usuario.password.label" default="Password" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="password" required="" value="${usuarioInstance?.password}"/>

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
						<label for="accountExpired">
							<g:message code="usuario.accountExpired.label" default="Account Expired" />
							
						</label>
						<g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}" />

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
						<label for="accountLocked">
							<g:message code="usuario.accountLocked.label" default="Account Locked" />
							
						</label>
						<g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
						<label for="enabled">
							<g:message code="usuario.enabled.label" default="Enabled" />
							
						</label>
						<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />

					</div>
					
					<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
						<label for="passwordExpired">
							<g:message code="usuario.passwordExpired.label" default="Password Expired" />
							
						</label>
						<g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}" />

					</div>
					
					%{-- fim do form --}%
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="${usuarioInstance?.id}">
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
