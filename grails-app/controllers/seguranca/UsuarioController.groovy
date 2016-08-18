package seguranca

import br.gov.sus.sinasan.doacao.exceptions.BusinessRuleException
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class UsuarioController {

    def usuarioService

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

    @Transactional
    def salvar(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        // caso tenha selecionado uma opção, lista vem como string
        if(params.perfis instanceof String) {
            params.perfis = [params.perfis]
        } else if (!params?.perfis) {
            params.perfis = []
        }

        try {
            usuarioInstance = usuarioService.salvar(usuarioInstance, params.perfis)
        } catch (BusinessRuleException e) {
            respond e.objeto.errors, view:'editar'
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance])
        redirect(action: 'exibir', id: usuarioInstance.id)
    }

    @Transactional
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
