package br.gov.sus.sinasan.doacao

class Hospital {

    String email

    static hasMany = [unidades: UnidadeHospitalar]

    static constraints = {
    }
}
