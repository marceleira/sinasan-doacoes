<%@ page import="br.gov.sus.sinasan.doacao.UnidadeHospitalar" %>



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

