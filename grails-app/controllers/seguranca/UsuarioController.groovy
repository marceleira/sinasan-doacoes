package seguranca

import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_USER'])
class UsuarioController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[usuarioInstanceList: Usuario.list(params), usuarioInstanceCount: Usuario.count()])
    }

//    @Secured(['ROLE_ADMIN'])
    def exibir(Usuario usuarioInstance) {
        render(view: "exibir", model: [usuarioInstance: usuarioInstance])
    }

    def criar() {
        render(view: "editar", model: [usuarioInstance: new Usuario(params)])
    }

    def editar(Usuario usuarioInstance) {
        render(view: "editar", model: [usuarioInstance: usuarioInstance])

    }

    def salvar(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'editar'
            return
        }

        usuarioInstance.save(flush:true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance])
        redirect(action: 'exibir', id: usuarioInstance.id)
    }

    def excluir(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance])
        redirect action:".", method:"GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
        redirect action: ".", method: "GET"
    }
}
