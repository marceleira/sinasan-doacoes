package br.gov.sus.sinasan.doacao

class Laboratorio {

    String nome
    String email
    String telefone

    static hasMany = [unidades: UnidadeLaboratorial]

    static constraints = {
        nome(blank: false, nullable: false, maxSize: 64)
        email(blank: false, nullable: false, email: true, maxSize: 64)
        telefone(blank: false, nullable: false, maxSize: 16)
    }

    String toString() {
        nome
    }
}
