package br.gov.sus.sinasan.doacao

class UnidadeLaboratorial {

    String nome
    Municipio municipio
    String endereco

    static belongsTo = [laboratorio: Laboratorio]

    static constraints = {
        nome(blank: false, nullable: false)
        endereco(blank: false, nullable: false)
    }
}
