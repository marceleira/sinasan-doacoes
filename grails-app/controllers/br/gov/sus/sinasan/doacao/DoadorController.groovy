package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class DoadorController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[doadorInstanceList: Doador.list(params), doadorInstanceCount: Doador.count()])
    }

    def exibir(Doador doadorInstance) {
        render(view: "exibir", model: [doadorInstance: doadorInstance])
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'doador.label', default: 'Doador'), params.id])
        redirect action: ".", method: "GET"
    }
}
