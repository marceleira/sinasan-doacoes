package br.gov.sus.sinasan.doacao

class Sexo {

    String codigo
    String nome

    static constraints = {
        codigo(blank: false, nullable: false, maxSize: 1, unique: true)
        nome(blank: false, nullable: false, maxSize: 16)
    }

    String toString() {
        nome
    }
}
