package br.gov.sus.sinasan.doacao

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class WsController {

    def remessaDoacoes = {
    }

    def rastrearBolsa = {
        String codigoBolsa = params?.id
        def dados = [:]

        BolsaSangue bolsaSangue = BolsaSangue.findByCodigo(codigoBolsa);

        dados.codigo = bolsaSangue.codigo
        dados.grupoSanguineo = bolsaSangue.grupoSanguineo.toString()
        dados.dataHoraAgendamento = bolsaSangue.doacao.dataHoraAgendamento.format("dd/MM/yyyy - HH:mm:ss")
        dados.unidadeLaboratorial = bolsaSangue.doacao.unidadeLaboratorial.nome
        dados.laboratorio = bolsaSangue.doacao.unidadeLaboratorial.laboratorio.nome
        dados.cpfDoador = bolsaSangue.doacao.doador.cpf
        dados.nomeDoador = bolsaSangue.doacao.doador.nomeCompleto
        dados.telefoneDoador = bolsaSangue.doacao.doador.telefone
        dados.emailDoador = bolsaSangue.doacao.doador.email
        dados.enderecoDoador = bolsaSangue.doacao.doador.endereco

        render dados as JSON
    }
}
