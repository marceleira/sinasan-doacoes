package br.gov.sus.sinasan.doacao

class Doacao {

    // dados do agendamento
    Laboratorio laboratorio
    Date dataHoraAgendamento

    static belongsTo = [doador: Doador]

    static constraints = {
    }
}
