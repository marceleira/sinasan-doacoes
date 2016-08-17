<%=packageName ? "package ${packageName}" : ''%>

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class ${className}Controller {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[${propertyName}List: ${className}.list(params), ${propertyName}Count: ${className}.count()])
    }

    def exibir(${className} ${propertyName}) {
        render(view: "exibir", model: [${propertyName}: ${propertyName}])
    }

    def criar() {
        render(view: "editar", model: [${propertyName}: new ${className}(params)])
    }

    def editar(${className} ${propertyName}) {
        render(view: "editar", model: [${propertyName}: ${propertyName}])

    }

    def salvar(${className} ${propertyName}) {
        if (${propertyName} == null) {
            notFound()
            return
        }

        if (${propertyName}.hasErrors()) {
            respond ${propertyName}.errors, view:'editar'
            return
        }

        ${propertyName}.save(flush:true)

        flash.message = message(code: 'default.updated.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}])
        redirect(action: 'exibir', id: ${propertyName}.id)
    }

    def excluir(${className} ${propertyName}) {

        if (${propertyName} == null) {
            notFound()
            return
        }

        ${propertyName}.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), ${propertyName}])
        redirect action:".", method:"GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: '${domainClass.propertyName}.label', default: '${className}'), params.id])
        redirect action: ".", method: "GET"
    }
}
