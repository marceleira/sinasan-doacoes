package br.gov.sus.sinasan.doacao

class Doacao {

    Laboratorio laboratorio
    Date dataHoraAgendamento

    static belongsTo = [doador: Doador]

    static constraints = {
    }
}
