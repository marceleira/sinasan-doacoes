import br.gov.sus.sinasan.doacao.Estado
import br.gov.sus.sinasan.doacao.Municipio
import br.gov.sus.sinasan.doacao.seguranca.Perfil
import br.gov.sus.sinasan.doacao.seguranca.Usuario
import br.gov.sus.sinasan.doacao.seguranca.UsuarioPerfil
import groovy.sql.Sql
import org.codehaus.groovy.grails.web.mapping.LinkGenerator

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

        carregaMunicipios()

    }
    def destroy = {
    }

    def carregaMunicipios = {

        def dataSource = grailsApplication.mainContext.getBean('dataSource')
        Estado estado = Estado.findByUf("MG")

        if(!estado) {
            def sql = new Sql(dataSource)
            def sqltxt = grailsApplication.parentContext.getResource("classpath:/resources/sql/estados.sql").inputStream.text
            sql.executeInsert(sqltxt);
        }

        Municipio municipio = Municipio.findByEstado(estado)
        if(!municipio) {
            def sql = new Sql(dataSource)
            def sqltxt = grailsApplication.parentContext.getResource("classpath:/resources/sql/municipios.sql").inputStream.text
            sql.executeInsert(sqltxt);
        }


    }

}
