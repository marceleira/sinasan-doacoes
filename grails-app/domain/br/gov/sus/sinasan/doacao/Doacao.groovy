package br.gov.sus.sinasan.doacao

class Doacao {

    // dados do agendamento
    UnidadeLaboratorial unidadeLaboratorial
    Date dataHoraAgendamento

    static belongsTo = [doador: Doador]

    static hasMany = [bolsasSangue: BolsaSangue]

    static constraints = {
        unidadeLaboratorial(nullable: false)
        dataHoraAgendamento(nullable: false)
    }
}
