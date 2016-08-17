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
	}

	static hasMany = [roles: Role]

	static mapping = {
		password column: '`password`'
		roles joinTable: [name: "usuario_role", key: 'usuario_id']
	}

	Set<Role> getAuthorities() {
		UsuarioRole.findAllByUsuario(this).collect { it.role }
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
