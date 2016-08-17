<%@ page import="seguranca.Role" %>



<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'authority', 'error')} required">
    <label for="authority">
        Authority
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="authority" required="" value="${roleInstance?.authority}"/>

</div>

