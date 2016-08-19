package br.gov.sus.sinasan.doacao

class Municipio {

    String nome

    static belongsTo = [estado: Estado]

    static constraints = {
        nome(blank: false, nullable: false)
        estado(nullable: false)
    }

    String toString() {
        nome
    }
}
