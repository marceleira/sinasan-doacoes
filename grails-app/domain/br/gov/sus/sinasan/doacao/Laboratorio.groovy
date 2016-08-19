package br.gov.sus.sinasan.doacao

class Laboratorio {

    String email

    static hasMany = [unidades: UnidadeLaboratorial]

    static constraints = {
    }
}
