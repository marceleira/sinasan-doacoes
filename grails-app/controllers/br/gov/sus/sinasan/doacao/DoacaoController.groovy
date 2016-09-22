package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class DoacaoController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[doacaoInstanceList: Doacao.list(params), doacaoInstanceCount: Doacao.count()])
    }

    def exibir(Doacao doacaoInstance) {
        render(view: "exibir", model: [doacaoInstance: doacaoInstance])
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'doacao.label', default: 'Doacao'), params.id])
        redirect action: ".", method: "GET"
    }
}
