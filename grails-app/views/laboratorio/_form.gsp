<%@ page import="br.gov.sus.sinasan.doacao.Laboratorio" %>



<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="laboratorio.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="64" required="" value="${laboratorioInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="laboratorio.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" maxlength="64" required="" value="${laboratorioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="laboratorio.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" maxlength="16" required="" value="${laboratorioInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'unidades', 'error')} ">
	<label for="unidades">
		<g:message code="laboratorio.unidades.label" default="Unidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${laboratorioInstance?.unidades?}" var="u">
    <li><g:link controller="unidadeLaboratorial" action="exibir" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="unidadeLaboratorial" action="criar" params="['laboratorio.id': laboratorioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unidadeLaboratorial.label', default: 'UnidadeLaboratorial')])}</g:link>
</li>
</ul>


</div>

