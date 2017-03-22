package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class MunicipioController {

    static allowedMethods = [salvar: "POST", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[municipioInstanceList: Municipio.list(params), municipioInstanceCount: Municipio.count()])
    }

    def exibir(Municipio municipioInstance) {
        render(view: "exibir", model: [municipioInstance: municipioInstance])
    }

    def criar() {
        render(view: "editar", model: [municipioInstance: new Municipio(params)])
    }

    def editar(Municipio municipioInstance) {
        render(view: "editar", model: [municipioInstance: municipioInstance])

    }

    def salvar(Municipio municipioInstance) {
        if (municipioInstance == null) {
            notFound()
            return
        }

        if (municipioInstance.hasErrors()) {
            respond municipioInstance.errors, view:'editar'
            return
        }

        municipioInstance.save(flush:true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'municipio.label', default: 'Municipio'), municipioInstance])
        redirect(action: 'exibir', id: municipioInstance.id)
    }

    def excluir(Municipio municipioInstance) {

        if (municipioInstance == null) {
            notFound()
            return
        }

        municipioInstance.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'municipio.label', default: 'Municipio'), municipioInstance])
        redirect action:".", method:"GET"
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipio.label', default: 'Municipio'), params.id])
        redirect action: ".", method: "GET"
    }
}
