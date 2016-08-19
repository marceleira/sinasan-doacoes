package br.gov.sus.sinasan.doacao.seguranca

class Perfil {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}

	String toString() {
		authority
	}
}
