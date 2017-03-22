package br.gov.sus.sinasan.doacao.seguranca

import br.gov.sus.sinasan.doacao.DoacaoService
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(DoacaoService)
class DoacaoServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:
        1==1
    }
}
