package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class HospitalController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model: [hospitalInstanceList: Hospital.list(params), hospitalInstanceCount: Hospital.count()])
    }

    def exibir(Hospital hospitalInstance) {
        render(view: "exibir", model: [hospitalInstance: hospitalInstance])
    }

    def criar() {
        render(view: "editar", model: [hospitalInstance: new Hospital(params)])
    }

    def editar(Hospital hospitalInstance) {
        render(view: "editar", model: [hospitalInstance: hospitalInstance])

    }

    @Transactional
    def salvar(Hospital hospitalInstance) {
        if (hospitalInstance == null) {
            notFound()
            return
        }

        if (hospitalInstance.hasErrors()) {
            respond hospitalInstance.errors, view: 'editar'
            return
        }

        hospitalInstance.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'hospital.label', default: 'Hospital'), hospitalInstance])
        redirect(action: 'exibir', id: hospitalInstance.id)
    }

    @Transactional
    def excluir(Hospital hospitalInstance) {

        if (hospitalInstance == null) {
            notFound()
            return
        }

        hospitalInstance.delete flush: true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'hospital.label', default: 'Hospital'), hospitalInstance])
        redirect action: ".", method: "GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), params.id])
        redirect action: ".", method: "GET"
    }
}
