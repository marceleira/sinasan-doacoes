package br.gov.sus.sinasan.doacao

class BolsaSangue {

    static hasMany = [exames: ExameLaboratorial]

    static constraints = {
    }
}