package br.gov.sus.sinasan.doacao

class Doacao {

    Date dataHoraAgendamento

    static belongsTo = [doador: Doador]

    static constraints = {
    }
}
