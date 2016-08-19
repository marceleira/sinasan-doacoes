import br.gov.sus.sinasan.doacao.seguranca.Perfil
import br.gov.sus.sinasan.doacao.seguranca.Usuario
import br.gov.sus.sinasan.doacao.seguranca.UsuarioPerfil

class BootStrap {

    def init = { servletContext ->

        def usuario = Usuario.findByUsername('master')

        if(!usuario) {
            usuario = new Usuario(username: 'master', password: '123');
            usuario.save();

            def perfil = new Perfil(authority: 'ROLE_USER');
            perfil.save();

            def usuarioPerfil = new UsuarioPerfil(usuario: usuario, perfil: perfil);
            usuarioPerfil.save();
        }

    }
    def destroy = {
    }
}
