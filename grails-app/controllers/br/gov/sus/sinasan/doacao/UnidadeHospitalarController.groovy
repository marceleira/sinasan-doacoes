package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class UnidadeHospitalarController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model: [unidadeHospitalarInstanceList: UnidadeHospitalar.list(params), unidadeHospitalarInstanceCount: UnidadeHospitalar.count()])
    }

    def exibir(UnidadeHospitalar unidadeHospitalarInstance) {
        render(view: "exibir", model: [unidadeHospitalarInstance: unidadeHospitalarInstance])
    }

    def criar() {
        render(view: "editar", model: [unidadeHospitalarInstance: new UnidadeHospitalar(params)])
    }

    def editar(UnidadeHospitalar unidadeHospitalarInstance) {
        render(view: "editar", model: [unidadeHospitalarInstance: unidadeHospitalarInstance])

    }

    @Transactional
    def salvar(UnidadeHospitalar unidadeHospitalarInstance) {
        if (unidadeHospitalarInstance == null) {
            notFound()
            return
        }

        if (unidadeHospitalarInstance.hasErrors()) {
            respond unidadeHospitalarInstance.errors, view: 'editar'
            return
        }

        unidadeHospitalarInstance.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'unidadeHospitalar.label', default: 'UnidadeHospitalar'), unidadeHospitalarInstance])
        redirect(action: 'exibir', id: unidadeHospitalarInstance.id)
    }

    @Transactional
    def excluir(UnidadeHospitalar unidadeHospitalarInstance) {

        if (unidadeHospitalarInstance == null) {
            notFound()
            return
        }

        unidadeHospitalarInstance.delete flush: true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'unidadeHospitalar.label', default: 'UnidadeHospitalar'), unidadeHospitalarInstance])
        redirect action: ".", method: "GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidadeHospitalar.label', default: 'UnidadeHospitalar'), params.id])
        redirect action: ".", method: "GET"
    }
}
