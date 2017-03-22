package br.gov.sus.sinasan.doacao

import br.gov.sus.sinasan.doacao.exceptions.BusinessRuleException
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class WsController {

    def doacaoService
    def messageSource

    def remessaDoacoes = {
    }

    // obter dados da bolsa de sangue
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

    def remessaDoacao = {

        params.dataAgendamento = params?.dataAgendamento ? params.dataAgendamento : ''
        params.horaAgendamento = params?.horaAgendamento ? params.horaAgendamento : ''

        UnidadeLaboratorial unidadeLaboratorial = UnidadeLaboratorial.get(Long.parseLong(params?.id as String))

        def dados = [:]

        dados.doador = [:]
        dados.doador.nomeCompleto       = params?.nomeDoador?.trim()
        dados.doador.sexo               = Sexo.findByCodigo(params?.codSexo as String)
        dados.doador.cpf                = params?.cpfDoador
        dados.doador.dataNascimento     = params?.dataNascimentoDoador
        dados.doador.endereco           = params?.enderecoDoador
        dados.doador.telefone           = params?.telefoneDoador
        dados.doador.email              = params?.emailDoador
        dados.doador.naturalidade       = params?.naturalidadeDoador
        dados.doador.nacionalidade      = params?.nacionalidadeDoador

        dados.doacao = [:]
        dados.doacao.dataHoraAgendamento = params?.dataAgendamento + params?.horaAgendamento
        dados.doacao.unidadeLaboratorial = unidadeLaboratorial

        dados.bolsa = [:]
        dados.bolsa.codigo             = params?.codigoBolsa
        dados.bolsa.grupoSanguineo     = GrupoSanguineo.findByCodigo(params?.codGrupoSanguineo as String)

        try {
            doacaoService.salvarDoacao(dados.doador as Doador, dados.doacao as Doacao, dados.bolsa as BolsaSangue)
        } catch (BusinessRuleException e) {

            def locale = Locale.default
            def listaErros = [:].withDefault { [] }
            for (fieldErrors in e.objeto.errors) {
                for (error in fieldErrors.allErrors) {
                    listaErros[error.field] << messageSource.getMessage(error, locale)
                }
            }

            def msg = [erro: 1, msg_erro: listaErros]
            render msg as JSON
            return
        }

        def msg = [erro: 0, msg_erro: "Remessa processada com sucesso!"]
        render msg as JSON
    }

}
