package seguranca

import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_USER'])
class PerfilController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[perfilInstanceList: Perfil.list(params), perfilInstanceCount: Perfil.count()])
    }

    def exibir(Perfil perfilInstance) {
        render(view: "exibir", model: [perfilInstance: perfilInstance])
    }

    def criar() {
        render(view: "editar", model: [perfilInstance: new Perfil(params)])
    }

    def editar(Perfil perfilInstance) {
        render(view: "editar", model: [perfilInstance: perfilInstance])
    }

    def salvar(Perfil perfilInstance) {
        if (perfilInstance == null) {
            notFound()
            return
        }

        if (perfilInstance.hasErrors()) {
            respond perfilInstance.errors, view:'editar'
            return
        }

        perfilInstance.save(flush:true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'perfil.label', default: 'Perfil'), perfilInstance])
        redirect(action: 'exibir', id: perfilInstance.id)
    }

    def excluir(Perfil perfilInstance) {

        if (perfilInstance == null) {
            notFound()
            return
        }

        perfilInstance.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'perfil.label', default: 'Perfil'), perfilInstance])
        redirect action:".", method:"GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'perfil.label', default: 'Perfil'), params.id])
        redirect action: ".", method: "GET"
    }
}
