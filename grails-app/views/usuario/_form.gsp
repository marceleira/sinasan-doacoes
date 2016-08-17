<%@ page import="seguranca.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
    <label for="username">
        Username
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" required="" value="${usuarioInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'password', 'error')} required">
    <label for="password">
        Password
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="password" required="" value="${usuarioInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountExpired', 'error')} ">
    <label for="accountExpired">
        Account Expired

    </label>
    <g:checkBox name="accountExpired" value="${usuarioInstance?.accountExpired}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
    <label for="accountLocked">
        Account Locked

    </label>
    <g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
        Enabled

    </label>
    <g:checkBox name="enabled" value="${usuarioInstance?.enabled}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'passwordExpired', 'error')} ">
    <label for="passwordExpired">
        Password Expired

    </label>
    <g:checkBox name="passwordExpired" value="${usuarioInstance?.passwordExpired}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'perfis', 'error')} ">
    <label for="perfis">
        Roles

    </label>
    <g:select name="perfis" from="${seguranca.Perfil.list()}" multiple="multiple" optionKey="id" size="5"
              value="${usuarioInstance?.perfis*.id}" class="many-to-many"/>

</div>

