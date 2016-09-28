package br.gov.sus.sinasan.doacao

class SituacaoBolsa {

    String nome

    static constraints = {
        nome(blank: false, nullable: false, maxSize: 32)
    }

    String toString() {
        nome
    }
}
