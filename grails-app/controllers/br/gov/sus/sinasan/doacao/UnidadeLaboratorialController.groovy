package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class UnidadeLaboratorialController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model: [unidadeLaboratorialInstanceList: UnidadeLaboratorial.list(params), unidadeLaboratorialInstanceCount: UnidadeLaboratorial.count()])
    }

    def exibir(UnidadeLaboratorial unidadeLaboratorialInstance) {
        render(view: "exibir", model: [unidadeLaboratorialInstance: unidadeLaboratorialInstance])
    }

    def criar() {
        render(view: "editar", model: [unidadeLaboratorialInstance: new UnidadeLaboratorial(params)])
    }

    def editar(UnidadeLaboratorial unidadeLaboratorialInstance) {
        render(view: "editar", model: [unidadeLaboratorialInstance: unidadeLaboratorialInstance])

    }

    @Transactional
    def salvar(UnidadeLaboratorial unidadeLaboratorialInstance) {
        if (unidadeLaboratorialInstance == null) {
            notFound()
            return
        }

        if (unidadeLaboratorialInstance.hasErrors()) {
            respond unidadeLaboratorialInstance.errors, view: 'editar'
            return
        }

        unidadeLaboratorialInstance.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'unidadeLaboratorial.label', default: 'UnidadeLaboratorial'), unidadeLaboratorialInstance])
        redirect(action: 'exibir', id: unidadeLaboratorialInstance.id)
    }

    @Transactional
    def excluir(UnidadeLaboratorial unidadeLaboratorialInstance) {

        if (unidadeLaboratorialInstance == null) {
            notFound()
            return
        }

        unidadeLaboratorialInstance.delete flush: true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'unidadeLaboratorial.label', default: 'UnidadeLaboratorial'), unidadeLaboratorialInstance])
        redirect action: ".", method: "GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidadeLaboratorial.label', default: 'UnidadeLaboratorial'), params.id])
        redirect action: ".", method: "GET"
    }
}
