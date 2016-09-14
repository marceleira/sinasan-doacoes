package br.gov.sus.sinasan.doacao

import br.gov.sus.sinasan.doacao.exceptions.BusinessRuleException
import grails.transaction.Transactional

@Transactional
class DoacaoService {

    def processaFileDoacoes(Integer codigoLaboratorio, File arquivo) throws BusinessRuleException {

        UnidadeLaboratorial unidadeLaboratorial = UnidadeLaboratorial.findByCodigo(codigoLaboratorio)

        if(!unidadeLaboratorial) {
            throw new BusinessRuleException("Unidade Laboratorial de código '$codigoLaboratorio' não cadastrada no sistema")
        }

        BufferedReader br = arquivo.newInputStream().newReader()

        String linha
        def dados = [:]
        for(def i = 0; linha = br.readLine() ; i++) {

            if(i == 0) {
                linha = linha.substring(0, 375)
            } else {
                linha = linha.substring(0, 374)
                linha = " "+linha;
            }

            dados.doador = [:]
            dados.doador.nomeCompleto       = linha.substring(0, 64).trim()
            dados.doador.sexo               = Sexo.findByCodigo(linha.substring(65, 66).trim().toUpperCase())
            dados.doador.cpf                = linha.substring(66, 77).trim()
            dados.doador.dataNascimento     = linha.substring(77, 85).trim()
            dados.doador.endereco           = linha.substring(85, 184).trim()
            dados.doador.telefone           = linha.substring(184, 200).trim()
            dados.doador.email              = linha.substring(200, 264).trim()
            dados.doador.naturalidade       = linha.substring(264, 296).trim()
            dados.doador.nacionalidade      = linha.substring(296, 328).trim()

            dados.doacao = [:]
            dados.doacao.dataHoraAgendamento = linha.substring(328, 336) + linha.substring(336, 340)
            dados.doacao.unidadeLaboratorial = unidadeLaboratorial

            dados.bolsa = [:]
            dados.bolsa.codigo             = linha.substring(340, 372).trim()
            dados.bolsa.grupoSanguineo     = GrupoSanguineo.findByCodigo(linha.substring(372, 375).trim())

            salvarDoacao(dados.doador as Doador, dados.doacao as Doacao, dados.bolsa as BolsaSangue)
        }

    }

    def salvarDoacao(Doador doador, Doacao doacao, BolsaSangue bolsaSangue) throws BusinessRuleException {

        doador = Doador.findByCpf(doador.cpf) ?: doador
        doador.save(flush: true, failOnError: true);

        doacao.doador = doador
        doacao.save(flush: true, failOnError: true)

        bolsaSangue.doacao = doacao
        bolsaSangue.save(flush: true, failOnError: true)
    }
}
