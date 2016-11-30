package br.gov.sus.sinasan.doacao



import grails.test.mixin.*
import spock.lang.*

@TestFor(HospitalController)
@Mock(Hospital)
class HospitalControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:
        1==1
    }

}
