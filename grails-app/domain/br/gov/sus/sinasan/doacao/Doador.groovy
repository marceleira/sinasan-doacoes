package br.gov.sus.sinasan.doacao

class Doador {

    String cpf
    String nomeCompleto
    Date dataNascimento
    String endereco
    String telefone
    String email

    String nacionalidade
    String naturalidade

    static hasMany = [doacoes: Doacao]

    static constraints = {
        cpf(nullable: false, blank: false)
    }
}
