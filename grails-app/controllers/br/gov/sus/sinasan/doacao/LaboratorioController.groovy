package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class LaboratorioController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model: [laboratorioInstanceList: Laboratorio.list(params), laboratorioInstanceCount: Laboratorio.count()])
    }

    def exibir(Laboratorio laboratorioInstance) {
        render(view: "exibir", model: [laboratorioInstance: laboratorioInstance])
    }

    def criar() {
        render(view: "editar", model: [laboratorioInstance: new Laboratorio(params)])
    }

    def editar(Laboratorio laboratorioInstance) {
        render(view: "editar", model: [laboratorioInstance: laboratorioInstance])

    }

    @Transactional
    def salvar(Laboratorio laboratorioInstance) {
        if (laboratorioInstance == null) {
            notFound()
            return
        }

        if (laboratorioInstance.hasErrors()) {
            respond laboratorioInstance.errors, view: 'editar'
            return
        }

        laboratorioInstance.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), laboratorioInstance])
        redirect(action: 'exibir', id: laboratorioInstance.id)
    }

    @Transactional
    def excluir(Laboratorio laboratorioInstance) {

        if (laboratorioInstance == null) {
            notFound()
            return
        }

        laboratorioInstance.delete flush: true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), laboratorioInstance])
        redirect action: ".", method: "GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratorio.label', default: 'Laboratorio'), params.id])
        redirect action: ".", method: "GET"
    }
}
