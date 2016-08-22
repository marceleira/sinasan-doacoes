<%@ page import="br.gov.sus.sinasan.doacao.UnidadeLaboratorial" %>



<div class="fieldcontain ${hasErrors(bean: unidadeLaboratorialInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="unidadeLaboratorial.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${unidadeLaboratorialInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unidadeLaboratorialInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="unidadeLaboratorial.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" required="" value="${unidadeLaboratorialInstance?.endereco}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unidadeLaboratorialInstance, field: 'laboratorio', 'error')} required">
	<label for="laboratorio">
		<g:message code="unidadeLaboratorial.laboratorio.label" default="Laboratorio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="laboratorio" name="laboratorio.id" from="${br.gov.sus.sinasan.doacao.Laboratorio.list()}" optionKey="id" required="" value="${unidadeLaboratorialInstance?.laboratorio?.id}" class="many-to-one"/>

</div>

