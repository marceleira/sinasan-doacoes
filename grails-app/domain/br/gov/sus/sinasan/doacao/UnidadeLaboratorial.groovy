package br.gov.sus.sinasan.doacao

class UnidadeLaboratorial {

    Integer codigo
    String nome
    Municipio municipio
    String endereco

    static belongsTo = [laboratorio: Laboratorio]

    static constraints = {
        codigo(nullable: false, unique: true)
        nome(blank: false, nullable: false)
        endereco(blank: false, nullable: false)
    }

    // autoincremento
    def beforeInsert() {
        def lastCodigo = UnidadeLaboratorial.createCriteria().get {
            projections {
                max "codigo"
            }
        }
        this.codigo = lastCodigo ? lastCodigo+1 : 1;
    }

    String toString() {
        this.nome
    }
}
