import br.gov.sus.sinasan.doacao.Estado
import br.gov.sus.sinasan.doacao.GrupoSanguineo
import br.gov.sus.sinasan.doacao.Hospital
import br.gov.sus.sinasan.doacao.Laboratorio
import br.gov.sus.sinasan.doacao.Municipio
import br.gov.sus.sinasan.doacao.Sexo
import br.gov.sus.sinasan.doacao.SituacaoBolsa
import br.gov.sus.sinasan.doacao.UnidadeHospitalar
import br.gov.sus.sinasan.doacao.UnidadeLaboratorial
import br.gov.sus.sinasan.doacao.seguranca.Perfil
import br.gov.sus.sinasan.doacao.seguranca.Usuario
import groovy.sql.Sql

class BootStrap {

    def grailsApplication

    def init = { servletContext ->

        def usuario = Usuario.findByUsername('master')

        if(!usuario) {

            def perfil = new Perfil(authority: 'ROLE_USER');
            perfil.save(flush: true);

            usuario = new Usuario(username: 'master', password: '123');
            usuario.addToPerfis(perfil)
            usuario.save(flush: true);
        }

        if(Estado.count() == 0) {
            carregaEstados()
        }
        if(Municipio.count() == 0) {
            carregaMunicipios()
        }
        if(Laboratorio.count() == 0) {
            carregaLaboratorios()
        }
        if(Hospital.count() == 0) {
            carregaHospitais()
        }
        if(Sexo.count() == 0) {
            carregaSexos()
        }
        if(GrupoSanguineo.count() == 0) {
            carregaGrupoSanguineo()
        }
        if(SituacaoBolsa.count() == 0) {
            carregaSituacao()
        }
    }

    def destroy = {
    }

    def carregaMunicipios = {

        def dataSource = grailsApplication.mainContext.getBean('dataSource')
        def sql = new Sql(dataSource)
        def sqltxt

        // municipios
        sqltxt = grailsApplication.parentContext.getResource("classpath:/resources/sql/municipios.sql").inputStream.text
        sql.executeInsert(sqltxt);
    }

    def carregaEstados = {

        def dataSource = grailsApplication.mainContext.getBean('dataSource')
        def sql = new Sql(dataSource)
        def sqltxt

        // estados
        sqltxt = grailsApplication.parentContext.getResource("classpath:/resources/sql/estados.sql").inputStream.text
        sql.executeInsert(sqltxt);
    }

    def carregaLaboratorios = {
        def laboratorio;
        def unidade;
        def municipioBH = Municipio.findByEstadoAndNome(Estado.findByUf("MG"), "Belo Horizonte");
        def municipioVespasiano = Municipio.findByEstadoAndNome(Estado.findByUf("MG"), "Vespasiano");
        def municipioIbirite = Municipio.findByEstadoAndNome(Estado.findByUf("MG"), "Ibirité");

        // lab
        laboratorio = new Laboratorio(nome: "Humberto Abrão", email: "sinasan@humbertoabrao.com.br", telefone: "(31) 3322-1132")
        laboratorio.save(flush: true)

        unidade = new UnidadeLaboratorial(nome: "Cidade Nova", endereco: "Av. Cristiano Machado, 1837 - Cidade Nova, Belo Horizonte - MG", municipio: municipioBH)
        unidade.save(flush: true)
        laboratorio.addToUnidades(unidade)

        unidade = new UnidadeLaboratorial(nome: "Buritis", endereco: "R. José Rodrigues Pereira, 385 - Buritis, Belo Horizonte - MG", municipio: municipioBH)
        unidade.save(flush: true)
        laboratorio.addToUnidades(unidade)

        // lab
        laboratorio = new Laboratorio(nome: "Hermes Pardini", email: "sinasan@hermespardini.com.br", telefone: "(31) 3212-0001")
        laboratorio.save(flush: true)

        unidade = new UnidadeLaboratorial(nome: "Pampulha", endereco: "Av. Pres. Antônio Carlos, 7781 - São Luiz, Belo Horizonte - MG", municipio: municipioBH)
        unidade.save(flush: true)
        laboratorio.addToUnidades(unidade)

        unidade = new UnidadeLaboratorial(nome: "Cidade Nova", endereco: "Av. Cristiano Machado, 597 - Cidade Nova, Belo Horizonte - MG", municipio: municipioBH)
        unidade.save(flush: true)
        laboratorio.addToUnidades(unidade)

        unidade = new UnidadeLaboratorial(nome: "Guarani", endereco: "Av. Waldomiro Lobo, 620 - Guarani, Belo Horizonte - MG", municipio: municipioBH)
        unidade.save(flush: true)
        laboratorio.addToUnidades(unidade)

        // lab
        laboratorio = new Laboratorio(nome: "São Marcos", email: "sinasan@saomarcos.com.br", telefone: "(31) 3232-8000")
        laboratorio.save(flush: true)

        unidade = new UnidadeLaboratorial(nome: "Barreiro", endereco: "R. Júlio de Mesquita, 242 - Marilândia (Jatobá), Belo Horizonte - MG", municipio: municipioBH)
        unidade.save(flush: true)
        laboratorio.addToUnidades(unidade)

        unidade = new UnidadeLaboratorial(nome: "Ibirité", endereco: "Av. Otacílio Negrão de Lima, 55 - São Geraldo, Ibirité - MG", municipio: municipioIbirite)
        unidade.save(flush: true)
        laboratorio.addToUnidades(unidade)

        // lab
        laboratorio = new Laboratorio(nome: "São Lucas", email: "sinasan@saolucas.com.br", telefone: "(31) 3232-9000")
        laboratorio.save(flush: true)
        laboratorio.addToUnidades(unidade)

        unidade = new UnidadeLaboratorial(nome: "Vespasiano", endereco: "Rua Alberto Lázaro, 28, Vespasiano - MG", municipio: municipioVespasiano)
        unidade.save(flush: true)
        laboratorio.addToUnidades(unidade)
    }

    def carregaHospitais = {

        def hospital
        def unidadeHospitalar

        def municipioBH = Municipio.findByEstadoAndNome(Estado.findByUf("MG"), "Belo Horizonte");

        // hosp
        hospital = new Hospital(nome: "Hospital Belo Horizonte", email: "sinasan@hospitalbelohorizonte.com.br", telefone: "(31) 3449-7000")
        hospital.save(flush: true)

        unidadeHospitalar = new UnidadeHospitalar(nome: "Cachoeirinha", endereco: "Av. Pres. Antônio Carlos, 1694 - Cachoeirinha, Belo Horizonte - MG", municipio: municipioBH)
        unidadeHospitalar.save(flush: true)
        hospital.addToUnidades(unidadeHospitalar)

        // hosp
        hospital = new Hospital(nome: "Lifecenter", email: "sinasan@lifecenter.com.br", telefone: "(31) 3449-7000")
        hospital.save(flush: true)

        unidadeHospitalar = new UnidadeHospitalar(nome: "São Lucas", endereco: "Av. do Contorno, 4747 - São Lucas, Belo Horizonte - MG", municipio: municipioBH)
        unidadeHospitalar.save(flush: true)
        hospital.addToUnidades(unidadeHospitalar)

        // hosp
        hospital = new Hospital(nome: "FHEMIG", email: "sinasan@fhemig.mg.gov.br", telefone: "(31) 3239-9200")
        hospital.save(flush: true)

        unidadeHospitalar = new UnidadeHospitalar(nome: "João XXIII", endereco: "Av. Professor Alfredo Balena, 400 - Santa Efigênia, Belo Horizonte - MG", municipio: municipioBH)
        unidadeHospitalar.save(flush: true)
        hospital.addToUnidades(unidadeHospitalar)
    }

    def carregaSexos = {
        new Sexo(codigo: "M", nome: "Masculino").save()
        new Sexo(codigo: "F", nome: "Feminino").save()
    }

    def carregaGrupoSanguineo = {
        new GrupoSanguineo(codigo: "O+").save()
        new GrupoSanguineo(codigo: "A+").save()
        new GrupoSanguineo(codigo: "B+").save()
        new GrupoSanguineo(codigo: "AB+").save()
        new GrupoSanguineo(codigo: "O-").save()
        new GrupoSanguineo(codigo: "A-").save()
        new GrupoSanguineo(codigo: "B-").save()
        new GrupoSanguineo(codigo: "AB-").save()
    }

    def carregaSituacao = {
        new SituacaoBolsa(nome: "AGUARDANDO EXAMES").save()
        new SituacaoBolsa(nome: "REALIZANDO EXAMES").save()
        new SituacaoBolsa(nome: "EM ESTOQUE").save()
        new SituacaoBolsa(nome: "ENCAMINHADA AO HOSPITAL").save()
        new SituacaoBolsa(nome: "RECEBIDA PELO HOSPITAL").save()
        new SituacaoBolsa(nome: "DESCARTE").save()
    }

}
