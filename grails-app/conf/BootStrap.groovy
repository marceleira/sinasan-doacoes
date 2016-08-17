import seguranca.Role
import seguranca.Usuario
import seguranca.UsuarioRole

class BootStrap {

    def init = { servletContext ->

        def usuario = Usuario.findByUsername('master')

        if(!usuario) {
            usuario = new Usuario(username: 'master', password: '123');
            usuario.save();

            def role = new Role(authority: 'ROLE_USER');
            role.save();

            def usuarioRole = new UsuarioRole(usuario: usuario, role: role);
            usuarioRole.save();
        }

    }
    def destroy = {
    }
}
