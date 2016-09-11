package br.gov.sus.sinasan.doacao

class BolsaSangue {

    String codigo
    GrupoSanguineo grupoSanguineo

    static belongsTo = [doacao: Doacao]

    static constraints = {
        codigo(nullable: false, blank: false, maxSize: 32)
        grupoSanguineo(nullable: false)
    }

    String toString() {
        codigo.toString()
    }
}
