package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class EstadoController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[estadoInstanceList: Estado.list(params), estadoInstanceCount: Estado.count()])
    }

    def exibir(Estado estadoInstance) {
        render(view: "exibir", model: [estadoInstance: estadoInstance])
    }

    def criar() {
        render(view: "editar", model: [estadoInstance: new Estado(params)])
    }

    def editar(Estado estadoInstance) {
        render(view: "editar", model: [estadoInstance: estadoInstance])

    }

    def salvar(Estado estadoInstance) {
        if (estadoInstance == null) {
            notFound()
            return
        }

        if (estadoInstance.hasErrors()) {
            respond estadoInstance.errors, view:'editar'
            return
        }

        estadoInstance.save(flush:true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance])
        redirect(action: 'exibir', id: estadoInstance.id)
    }

    def excluir(Estado estadoInstance) {

        if (estadoInstance == null) {
            notFound()
            return
        }

        estadoInstance.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'estado.label', default: 'Estado'), estadoInstance])
        redirect action:".", method:"GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'estado.label', default: 'Estado'), params.id])
        redirect action: ".", method: "GET"
    }
}
