package br.gov.sus.sinasan.doacao

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class BolsaSangueController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render(view: "index", model:[bolsaSangueInstanceList: BolsaSangue.list(params), bolsaSangueInstanceCount: BolsaSangue.count()])
    }

    def exibir(BolsaSangue bolsaSangueInstance) {
        render(view: "exibir", model: [bolsaSangueInstance: bolsaSangueInstance])
    }

    protected void notFound() {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'bolsaSangue.label', default: 'BolsaSangue'), params.id])
        redirect action: ".", method: "GET"
    }
}
