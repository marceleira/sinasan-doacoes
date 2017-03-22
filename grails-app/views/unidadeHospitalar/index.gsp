
<%@ page import="br.gov.sus.sinasan.doacao.UnidadeHospitalar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeHospitalar.label', default: 'UnidadeHospitalar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav_grails" role="navigation">
			<ul>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unidadeHospitalar" class="content_grails scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="nome" title="${message(code: 'unidadeHospitalar.nome.label', default: 'Nome')}" />

						<th><g:message code="unidadeHospitalar.hospital.label" default="Hospital" /></th>
					
						<th><g:message code="unidadeHospitalar.municipio.label" default="Municipio" /></th>

						<g:sortableColumn property="codigo" title="${message(code: 'unidadeHospitalar.codigo.label', default: 'Código')}" />
					</tr>

				</thead>
				<tbody>
				<g:each in="${unidadeHospitalarInstanceList}" status="i" var="unidadeHospitalarInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="exibir" id="${unidadeHospitalarInstance.id}">${fieldValue(bean: unidadeHospitalarInstance, field: "nome")}</g:link></td>

						<td>${fieldValue(bean: unidadeHospitalarInstance, field: "hospital")}</td>

						<td>${fieldValue(bean: unidadeHospitalarInstance, field: "municipio")}</td>

						<td>${fieldValue(bean: unidadeHospitalarInstance, field: "codigo")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination_grails">
				<g:paginate total="${unidadeHospitalarInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
