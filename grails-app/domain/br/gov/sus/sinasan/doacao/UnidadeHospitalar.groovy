package br.gov.sus.sinasan.doacao

class UnidadeHospitalar {

    String nome
    String endereco

    static belongsTo = [hospital: Hospital]

    static constraints = {
        nome(blank: false, nullable: false)
        endereco(blank: false, nullable: false)
    }
}
