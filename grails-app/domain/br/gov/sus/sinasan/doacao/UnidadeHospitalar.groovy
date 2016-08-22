package br.gov.sus.sinasan.doacao

class UnidadeHospitalar {

    String nome
    Municipio municipio
    String endereco

    static belongsTo = [hospital: Hospital]

    static constraints = {
        nome(blank: false, nullable: false)
        endereco(blank: false, nullable: false)
    }

    String toString() {
        nome
    }
}
