package seguranca

import br.gov.sus.sinasan.doacao.exceptions.BusinessRuleException
import grails.transaction.Transactional


@Transactional(readOnly = true)
class UsuarioService {

    @Transactional
    Usuario salvar(Usuario usuarioInstance, def perfis) {

        Perfil perfil

        if(usuarioInstance.id) {
            usuarioInstance.perfis.clear()
        }

        // adicionar perfis
        perfis.each { String perfil_id ->
            perfil = Perfil.get(perfil_id.toLong())
            if(perfil && !usuarioInstance.perfis.contains(perfil)) {
                usuarioInstance.addToPerfis(perfil)
            }
        }

        // removendo perfis
        usuarioInstance.perfis.each {
            if(perfis.contains(it)) {
                usuarioInstance.removeFromPerfis(it)
            }
        }

        usuarioInstance.validate()

        if(usuarioInstance.hasErrors()) {
            throw new BusinessRuleException(usuarioInstance as Object)
        }

        usuarioInstance.save(flush:true)

        return usuarioInstance
    }
}
