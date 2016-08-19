package br.gov.sus.sinasan.doacao

class Estado {

    String uf
    String nome

    static hasMany = [municipios: Municipio]

    static constraints = {
        uf(maxSize: 2, blank: false, nullable: false)
        nome(blank: false, nullable: false)
    }

    String toString() {
        uf
    }
}
