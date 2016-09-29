package br.gov.sus.sinasan.doacao

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_WEBSERVICE'])
class WsController {

    def remessaDoacoes = {
    }

    def rastrearBolsa = {
        String codigoBolsa = params?.id
        def dados = [:]

        dados.erro = 0
        dados.msg_erro = ''

        BolsaSangue bolsaSangue = BolsaSangue.findByCodigo(codigoBolsa);

        // finaliza com erro
        if(!bolsaSangue) {
            dados.erro = 1
            dados.msg_erro = message(code: 'default.not.found.message', args: [message(code: 'bolsaSangue.label'), params.id])
            render dados as JSON
            return
        }

        dados.codigo = bolsaSangue.codigo
        dados.situacaoBolsa = bolsaSangue.situacaoBolsa.toString()
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
