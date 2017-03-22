package br.gov.sus.sinasan.doacao

import br.gov.sus.sinasan.doacao.Sexo
import br.gov.sus.sinasan.doacao.SexoController
import grails.test.mixin.*
import spock.lang.*

@TestFor(SexoController)
@Mock(Sexo)
class SexoControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:
        1==1
    }
}
