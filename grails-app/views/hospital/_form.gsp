<%@ page import="br.gov.sus.sinasan.doacao.Hospital" %>



<div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="hospital.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="64" required="" value="${hospitalInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="hospital.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" maxlength="64" required="" value="${hospitalInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="hospital.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefone" maxlength="16" required="" value="${hospitalInstance?.telefone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: hospitalInstance, field: 'unidades', 'error')} ">
	<label for="unidades">
		<g:message code="hospital.unidades.label" default="Unidades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${hospitalInstance?.unidades?}" var="u">
    <li><g:link controller="unidadeHospitalar" action="exibir" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="unidadeHospitalar" action="criar" params="['hospital.id': hospitalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unidadeHospitalar.label', default: 'UnidadeHospitalar')])}</g:link>
</li>
</ul>


</div>

