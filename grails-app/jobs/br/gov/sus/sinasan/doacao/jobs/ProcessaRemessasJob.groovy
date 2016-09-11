package br.gov.sus.sinasan.doacao.jobs

import grails.util.Holders
import java.util.regex.Matcher
import java.util.regex.Pattern

class ProcessaRemessasJob {

    def doacaoService

    static triggers = {
//        cron name: 'processamentoRemessas', cronExpression: "0 0 6 * * ?"
//        simple name:'processamentoRemessas', startDelay:1000, repeatInterval: 60000, repeatCount: -1 // executa a cada 60 segundos
        simple name:'processamentoRemessas', startDelay:1000, repeatInterval: 60000, repeatCount: 1 // executa a cada 60 segundos
    }

    def execute() {
        processaRemessaDoacoes()
    }


    def processaRemessaDoacoes = {

        File caminhoRemessas = new File((String)Holders.config.jobs.remessas.pendentes);
        Pattern patternFileDoacoes = Pattern.compile("LB\\d+");
        Matcher matcher
        Integer codigoLaboratorio

        try {
            for(File arquivo in caminhoRemessas.listFiles() ) {
                if(!arquivo.isDirectory() && arquivo.name.startsWith("DOACAO")) { // PROCESSAMENTO PARA ARQUIVOS DE DOACAO
                    // remove arquivo já processado
                    if(arquivoJaProcessado(arquivo.name)) {
                        arquivo.delete()
                        continue;
                    }

                    matcher = patternFileDoacoes.matcher(arquivo.name)
                    matcher.find()
                    // pega o código da unidade laboratorial no nome do arquivo (exemplo LB00005 == 5)
                    codigoLaboratorio = matcher.group(0).replace("LB", "").toInteger()
                    // processa dados do arquivo de doacao
                    doacaoService.processaFileDoacoes(codigoLaboratorio, arquivo)
                    // move o arquivo para o caminho de arquivos processados
                    moveArquivoProcessado(arquivo)
                }
            }

        } catch (IOException e) {
            println("Erro na leitura do arquivo")
            println("Mensagem: "+e.message)
        }

        println("PROCESSAMENTO FINALIZADO COM SUCESSO!");

    }

    // verifica se o arquivo ja foi processado
    def arquivoJaProcessado(String filename) {

        File f = new File((String)Holders.config.jobs.remessas.processadas+filename);
        if(f.exists() && !f.isDirectory()) {
            return true
        }
        return false
    }

    def moveArquivoProcessado(File arquivo) {
        arquivo.renameTo(new File((String)Holders.config.jobs.remessas.processadas + arquivo.getName()))
    }

}
