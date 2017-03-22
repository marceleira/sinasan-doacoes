package br.gov.sus.sinasan.doacao.jobs

import grails.util.Holders
import java.util.regex.Matcher
import java.util.regex.Pattern
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption

class ProcessaRemessasJob {

    def doacaoService

    static triggers = {
//        cron name: 'processamentoRemessas', cronExpression: "0 0 6 * * ?"
        simple name:'processamentoRemessas', startDelay:1000, repeatInterval: 60000, repeatCount: -1 // executa a cada 60 segundos
//        simple name:'processamentoRemessas', startDelay:1000, repeatInterval: 60000, repeatCount: 1 // executa a cada 60 segundos
    }

    def execute() {
        processaRemessaDoacoes()
    }


    def processaRemessaDoacoes = {

        File caminhoRemessas = new File((String)Holders.config.jobs.remessas.pendentes);
        Pattern patternFileDoacoes = Pattern.compile("LB\\d+");
        Matcher matcher
        Integer codigoLaboratorio
        Integer contArquivos = 0; // contador de arquivos processados

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
                    contArquivos++
                }
            }

        } catch (IOException e) {
            log.error("Erro na leitura do arquivo: $e.message")
        }

        if(contArquivos) {
            log.info("$contArquivos arquivo(s) processado(s) com sucesso!");
        }
        log.info("PROCESSAMENTO FINALIZADO!");

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
        Path source = Paths.get((String)Holders.config.jobs.remessas.pendentes + arquivo.getName());
        Path newdir = Paths.get((String)Holders.config.jobs.remessas.processadas + arquivo.getName());
        Files.move(source, newdir, StandardCopyOption.REPLACE_EXISTING);
    }

}
