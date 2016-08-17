package seguranca

import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_USER'])
class RoleController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[roleInstanceList: Role.list(params), roleInstanceCount: Role.count()])
    }

    def exibir(Role roleInstance) {
        render(view: "exibir", model: [roleInstance: roleInstance])
    }

    def criar() {
        render(view: "editar", model: [roleInstance: new Role(params)])
    }

    def editar(Role roleInstance) {
        render(view: "editar", model: [roleInstance: roleInstance])
    }

    def salvar(Role roleInstance) {
        if (roleInstance == null) {
            notFound()
            return
        }

        if (roleInstance.hasErrors()) {
            respond roleInstance.errors, view:'editar'
            return
        }

        roleInstance.save(flush:true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'role.label', default: 'Role'), roleInstance])
        redirect(action: 'exibir', id: roleInstance.id)
    }

    def excluir(Role roleInstance) {

        if (roleInstance == null) {
            notFound()
            return
        }

        roleInstance.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'role.label', default: 'Role'), roleInstance])
        redirect action:".", method:"GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])
        redirect action: ".", method: "GET"
    }
}
