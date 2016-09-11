package br.gov.sus.sinasan.doacao

class Doador {

    String cpf
    String nomeCompleto
    Sexo sexo
    Date dataNascimento
    String endereco
    String telefone
    String email

    String nacionalidade
    String naturalidade

    static hasMany = [doacoes: Doacao]

    static constraints = {
        cpf(nullable: false, blank: false, maxSize: 11)
        nomeCompleto(nullable: false, blank: false, maxSize: 64)
        sexo(nullable: false)
        dataNascimento(nullable: false)
        endereco(nullable: false, blank: false, maxSize: 100)
        telefone(nullable: false, blank: false, maxSize: 16)
        email(nullable: false, blank: false, maxSize: 64)
        naturalidade(nullable: false, blank: false, maxSize: 32)
        nacionalidade(nullable: false, blank: false, maxSize: 32)
    }
}
