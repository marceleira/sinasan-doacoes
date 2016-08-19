<%@ page import="br.gov.sus.sinasan.doacao.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'uf', 'error')} required">
	<label for="uf">
		<g:message code="estado.uf.label" default="Uf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uf" maxlength="2" required="" value="${estadoInstance?.uf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="estado.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${estadoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'municipios', 'error')} ">
	<label for="municipios">
		<g:message code="estado.municipios.label" default="Municipios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${estadoInstance?.municipios?}" var="m">
    <li><g:link controller="municipio" action="exibir" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="municipio" action="criar" params="['estado.id': estadoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'municipio.label', default: 'Municipio')])}</g:link>
</li>
</ul>


</div>

