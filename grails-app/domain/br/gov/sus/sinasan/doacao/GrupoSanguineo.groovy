package br.gov.sus.sinasan.doacao

class GrupoSanguineo {

    String codigo

    static constraints = {
        codigo(blank: false, nullable: false, unique: true, maxSize: 3)
    }

    String toString() {
        codigo
    }
}
