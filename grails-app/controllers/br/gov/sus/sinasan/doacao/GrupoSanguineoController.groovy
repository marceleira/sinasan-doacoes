package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class GrupoSanguineoController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model: [grupoSanguineoInstanceList: GrupoSanguineo.list(params), grupoSanguineoInstanceCount: GrupoSanguineo.count()])
    }

    def exibir(GrupoSanguineo grupoSanguineoInstance) {
        render(view: "exibir", model: [grupoSanguineoInstance: grupoSanguineoInstance])
    }

    def criar() {
        render(view: "editar", model: [grupoSanguineoInstance: new GrupoSanguineo(params)])
    }

    def editar(GrupoSanguineo grupoSanguineoInstance) {
        render(view: "editar", model: [grupoSanguineoInstance: grupoSanguineoInstance])

    }

    @Transactional
    def salvar(GrupoSanguineo grupoSanguineoInstance) {
        if (grupoSanguineoInstance == null) {
            notFound()
            return
        }

        if (grupoSanguineoInstance.hasErrors()) {
            respond grupoSanguineoInstance.errors, view: 'editar'
            return
        }

        grupoSanguineoInstance.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'grupoSanguineo.label', default: 'GrupoSanguineo'), grupoSanguineoInstance])
        redirect(action: 'exibir', id: grupoSanguineoInstance.id)
    }

    @Transactional
    def excluir(GrupoSanguineo grupoSanguineoInstance) {

        if (grupoSanguineoInstance == null) {
            notFound()
            return
        }

        grupoSanguineoInstance.delete flush: true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'grupoSanguineo.label', default: 'GrupoSanguineo'), grupoSanguineoInstance])
        redirect action: ".", method: "GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'grupoSanguineo.label', default: 'GrupoSanguineo'), params.id])
        redirect action: ".", method: "GET"
    }
}
