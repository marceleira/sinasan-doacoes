package br.gov.sus.sinasan.doacao

class Doacao {

    // dados do agendamento
    UnidadeLaboratorial unidadeLaboratorial
    Date dataHoraAgendamento

    static belongsTo = [doador: Doador]

    static constraints = {
    }
}
