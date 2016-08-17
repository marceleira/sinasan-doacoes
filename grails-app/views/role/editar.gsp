<%@ page import="seguranca.Role" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}"/>

    <g:if test="${roleInstance?.id}">
        <title><g:message code="default.edit.label" args="[entityName]"/></title>
    </g:if>
    <g:else>
        <title><g:message code="default.create.label" args="[entityName]"/></title>
    </g:else>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="criar"><g:message code="default.create.label"
                                                             args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="edit-role" class="content scaffold-edit" role="main">
    <h1>
        <g:if test="${roleInstance?.id}">
            <g:message code="default.edit.label" args="[entityName]"/>
        </g:if>
        <g:else>
            <g:message code="default.create.label" args="[entityName]"/>
        </g:else>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${roleInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${roleInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: roleInstance, action: 'salvar']" method="POST">
        <g:hiddenField name="version" value="${roleInstance?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:if test="${roleInstance?.id}">
                <g:actionSubmit class="save" action="salvar"
                                value="${message(code: 'default.button.update.label', default: 'Salvar')}"/>
            </g:if>
            <g:else>
                <g:actionSubmit class="save" action="salvar"
                                value="${message(code: 'default.button.create.label', default: 'Criar')}"/>
            </g:else>
        </fieldset>
    </g:form>
</div>
</body>
</html>
