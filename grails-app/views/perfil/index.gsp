<%@ page import="seguranca.Perfil" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'perfil.label', default: 'Perfil')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="criar"><g:message code="default.create.label"
                                                             args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-role" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="authority"
                              title="${message(code: 'perfil.authority.label', default: 'Authority')}"/>

            <th style="width: 200px"></th>
        </tr>

        </thead>
        <tbody>
        <g:each in="${perfilInstanceList}" status="i" var="perfilInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="exibir"
                            id="${perfilInstance.id}">${fieldValue(bean: perfilInstance, field: "authority")}</g:link></td>



                <td>
                    <g:form url="[resource: perfilInstance, action: 'excluir']" method="DELETE">
                        <span class="buttons">
                            <g:link class="edit" action="editar" resource="${perfilInstance}"><g:message
                                    code="default.button.edit.label" default="Editar"/></g:link>
                            <g:actionSubmit class="delete" action="excluir"
                                            value="${message(code: 'default.button.delete.label', default: 'Excluir')}"
                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');"/>
                        </span>
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${perfilInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>