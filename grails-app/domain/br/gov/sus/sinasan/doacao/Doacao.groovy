package br.gov.sus.sinasan.doacao

import org.grails.databinding.BindingFormat

class Doacao {

    // dados do agendamento
    UnidadeLaboratorial unidadeLaboratorial
    @BindingFormat('yyyyMMddHHmm')
    Date dataHoraAgendamento

    static belongsTo = [doador: Doador]

    static hasMany = [bolsasSangue: BolsaSangue]

    static transients = ['dataHoraAgendamentoString']

    static constraints = {
        unidadeLaboratorial(nullable: false)
        dataHoraAgendamento(nullable: false)
    }

    String getDataHoraAgendamentoString() {
        this.dataHoraAgendamento.format("dd/MM/yyyy - HH:mm:ss")
    }

    String toString() {
        this.unidadeLaboratorial.toString() + ' - ' + this.dataHoraAgendamentoString
    }

}
