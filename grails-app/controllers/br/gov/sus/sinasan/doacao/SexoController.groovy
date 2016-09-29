package br.gov.sus.sinasan.doacao

import br.gov.sus.sinasan.doacao.Sexo
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class SexoController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[sexoInstanceList: Sexo.list(params), sexoInstanceCount: Sexo.count()])
    }

    def exibir(Sexo sexoInstance) {
        render(view: "exibir", model: [sexoInstance: sexoInstance])
    }

    def criar() {
        render(view: "editar", model: [sexoInstance: new Sexo(params)])
    }

    def editar(Sexo sexoInstance) {
        render(view: "editar", model: [sexoInstance: sexoInstance])

    }

    @Transactional
    def salvar(Sexo sexoInstance) {
        if (sexoInstance == null) {
            notFound()
            return
        }

        if (sexoInstance.hasErrors()) {
            respond sexoInstance.errors, view:'editar'
            return
        }

        sexoInstance.save(flush:true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sexo.label', default: 'Sexo'), sexoInstance])
        redirect(action: 'exibir', id: sexoInstance.id)
    }

    @Transactional
    def excluir(Sexo sexoInstance) {

        if (sexoInstance == null) {
            notFound()
            return
        }

        sexoInstance.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'sexo.label', default: 'Sexo'), sexoInstance])
        redirect action:".", method:"GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'sexo.label', default: 'Sexo'), params.id])
        redirect action: ".", method: "GET"
    }
}
