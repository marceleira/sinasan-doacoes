package seguranca

class Usuario {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		perfis nullable: false
	}

	static hasMany = [perfis: Perfil]

	static mapping = {
		password column: '`password`'
		perfis joinTable: [name: "usuario_perfil", key: 'usuario_id']
	}

	Set<Perfil> getAuthorities() {
		UsuarioPerfil.findAllByUsuario(this).collect { it.perfil }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	String toString() {
		username
	}
}
