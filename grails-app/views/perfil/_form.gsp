<%@ page import="seguranca.Perfil" %>



<div class="fieldcontain ${hasErrors(bean: perfilInstance, field: 'authority', 'error')} required">
    <label for="authority">
        Authority
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="authority" required="" value="${perfilInstance?.authority}"/>

</div>

