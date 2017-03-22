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

        InputStream is = arquivo.newInputStream()
        BufferedReader br = is.newReader()

        String linha
        def dados = [:]
        for(def i = 0; linha = br.readLine() ; i++) {

            dados.doador = [:]
            dados.doador.nomeCompleto       = linha.substring(0, 64).trim()
            dados.doador.sexo               = Sexo.findByCodigo(linha.substring(64, 65).trim().toUpperCase())
            dados.doador.cpf                = linha.substring(65, 76).trim()
            dados.doador.dataNascimento     = linha.substring(76, 84).trim()
            dados.doador.endereco           = linha.substring(84, 184).trim()
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

        br.close();
        is.close()
    }

    def salvarDoacao(Doador doador, Doacao doacao, BolsaSangue bolsaSangue) throws BusinessRuleException {

        Doador doadorInstance = Doador.findByCpf(doador.cpf) ?: new Doador()
        doadorInstance.properties = doador.properties
        if(!doadorInstance.validate()) {
            throw new BusinessRuleException(doadorInstance as Object)
        }
        doadorInstance.save(flush: true)

        Doacao doacaoInstance = Doacao.findByDoadorAndDataHoraAgendamentoAndUnidadeLaboratorial(doadorInstance, doacao.dataHoraAgendamento, doacao.unidadeLaboratorial) ?: new Doacao()
        doacaoInstance.properties = doacao.properties
        doacaoInstance.doador = doadorInstance
        if(!doacaoInstance.validate()) {
            throw new BusinessRuleException(doacaoInstance as Object)
        }
        doacaoInstance.save(flush: true)

        BolsaSangue bolsaSangueInstance = BolsaSangue.findByDoacao(doacaoInstance) ?: new BolsaSangue()
        bolsaSangueInstance.properties = bolsaSangue.properties
        bolsaSangueInstance.doacao = doacaoInstance
        bolsaSangueInstance.situacaoBolsa = SituacaoBolsa.findByNome("AGUARDANDO EXAMES");
        if(!bolsaSangueInstance.validate()) {
            throw new BusinessRuleException(bolsaSangueInstance as Object)
        }
        bolsaSangueInstance.save(flush: true)
    }
}
