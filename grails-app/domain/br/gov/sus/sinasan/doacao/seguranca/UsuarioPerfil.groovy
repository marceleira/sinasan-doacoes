package br.gov.sus.sinasan.doacao.seguranca

import org.apache.commons.lang.builder.HashCodeBuilder

class UsuarioPerfil implements Serializable {

	private static final long serialVersionUID = 1

	Usuario usuario
	Perfil perfil

	boolean equals(other) {
		if (!(other instanceof UsuarioPerfil)) {
			return false
		}

		other.usuario?.id == usuario?.id &&
		other.perfil?.id == perfil?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (usuario) builder.append(usuario.id)
		if (perfil) builder.append(perfil.id)
		builder.toHashCode()
	}

	static UsuarioPerfil get(long usuarioId, long idPerfil) {
		UsuarioPerfil.where {
			usuario == Usuario.load(usuarioId) &&
			perfil == Perfil.load(idPerfil)
		}.get()
	}

	static boolean exists(long usuarioId, long idPerfil) {
		UsuarioPerfil.where {
			usuario == Usuario.load(usuarioId) &&
			perfil == Perfil.load(idPerfil)
		}.count() > 0
	}

	static UsuarioPerfil create(Usuario usuario, Perfil perfil, boolean flush = false) {
		def instance = new UsuarioPerfil(usuario: usuario, perfil: perfil)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Usuario u, Perfil r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = UsuarioPerfil.where {
			usuario == Usuario.load(u.id) &&
			perfil == Perfil.load(r.id)
		}.deleteAll()

		if (flush) { UsuarioPerfil.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(Usuario u, boolean flush = false) {
		if (u == null) return

		UsuarioPerfil.where {
			usuario == Usuario.load(u.id)
		}.deleteAll()

		if (flush) { UsuarioPerfil.withSession { it.flush() } }
	}

	static void removeAll(Perfil r, boolean flush = false) {
		if (r == null) return

		UsuarioPerfil.where {
			perfil == Perfil.load(r.id)
		}.deleteAll()

		if (flush) { UsuarioPerfil.withSession { it.flush() } }
	}

	static constraints = {
		perfil validator: { Perfil r, UsuarioPerfil ur ->
			if (ur.usuario == null) return
			boolean existing = false
			UsuarioPerfil.withNewSession {
				existing = UsuarioPerfil.exists(ur.usuario.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['perfil', 'usuario']
		version false
	}
}
