<%=packageName%>
<% import grails.persistence.Event %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />

        <g:if test="\${${propertyName}?.id}">
            <title><g:message code="default.edit.label" args="[entityName]" /></title>
        </g:if>
        <g:else>
            <title><g:message code="default.create.label" args="[entityName]" /></title>
        </g:else>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="."><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="criar"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-${domainClass.propertyName}" class="content scaffold-edit" role="main">
			<h1>
                <g:if test="\${${propertyName}?.id}">
                    <g:message code="default.edit.label" args="[entityName]" />
                </g:if>
                <g:else>
                    <g:message code="default.create.label" args="[entityName]" />
                </g:else>
            </h1>
			<g:if test="\${flash.message}">
			<div class="message" role="status">\${flash.message}</div>
			</g:if>
			<g:hasErrors bean="\${${propertyName}}">
			<ul class="errors" role="alert">
				<g:eachError bean="\${${propertyName}}" var="error">
				<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:${propertyName}, action:'salvar']" method="POST" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
				<g:hiddenField name="version" value="\${${propertyName}?.version}" />
				<fieldset class="form">
					%{-- inicio do form --}%
					<%  excludedProps = Event.allEvents.toList() << 'version' << 'dateCreated' << 'lastUpdated'
					persistentPropNames = domainClass.persistentProperties*.name
					boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate') || pluginManager?.hasGrailsPlugin('hibernate4')
					if (hasHibernate) {
						def GrailsDomainBinder = getClass().classLoader.loadClass('org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsDomainBinder')
						if (GrailsDomainBinder.newInstance().getMapping(domainClass)?.identity?.generator == 'assigned') {
							persistentPropNames << domainClass.identifier.name
						}
					}
					props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
					Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					for (p in props) {
						if (p.embedded) {
							def embeddedPropNames = p.component.persistentProperties*.name
							def embeddedProps = p.component.properties.findAll { embeddedPropNames.contains(it.name) && !excludedProps.contains(it.name) }
							Collections.sort(embeddedProps, comparator.constructors[0].newInstance([p.component] as Object[]))
					%><fieldset class="embedded"><legend><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></legend><%
						for (ep in p.component.properties) {
							renderFieldForProperty(ep, p.component, "${p.name}.")
						}
				%></fieldset><%
						} else {
							renderFieldForProperty(p, domainClass)
						}
					}

					private renderFieldForProperty(p, owningClass, prefix = "") {
						boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate') || pluginManager?.hasGrailsPlugin('hibernate4')
						boolean display = true
						boolean required = false
						if (hasHibernate) {
							cp = owningClass.constrainedProperties[p.name]
							display = (cp ? cp.display : true)
							required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable && (cp.propertyType != String || !cp.blank) : false)
						}
						if (display) { %>
					<div class="fieldcontain \${hasErrors(bean: ${propertyName}, field: '${prefix}${p.name}', 'error')} ${required ? 'required' : ''}">
						<label for="${prefix}${p.name}">
							<g:message code="${domainClass.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}" />
							<% if (required) { %><span class="required-indicator">*</span><% } %>
						</label>
						${renderEditor(p)}
					</div>
					<%  }   } %>
					%{-- fim do form --}%
				</fieldset>
				<fieldset class="buttons">
                    <g:if test="\${${propertyName}?.id}">
                        <g:actionSubmit class="save" action="salvar" value="\${message(code: 'default.button.update.label', default: 'Salvar')}" />
                    </g:if>
                    <g:else>
                        <g:actionSubmit class="save" action="salvar" value="\${message(code: 'default.button.create.label', default: 'Criar')}" />
                    </g:else>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
