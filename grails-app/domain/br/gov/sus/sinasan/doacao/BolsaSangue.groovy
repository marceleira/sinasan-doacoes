package br.gov.sus.sinasan.doacao

class BolsaSangue {

    String codigo
    GrupoSanguineo grupoSanguineo
    SituacaoBolsa situacaoBolsa

    static belongsTo = [doacao: Doacao]

    static constraints = {
        codigo(nullable: false, blank: false, maxSize: 32)
        grupoSanguineo(nullable: false)
        situacaoBolsa(nullable: false)
    }

    String toString() {
        codigo.toString()
    }
}
