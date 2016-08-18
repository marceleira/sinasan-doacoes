package br.gov.sus.sinasan.doacao.exceptions

class BusinessRuleException extends RuntimeException {

      Object objeto

      def BusinessRuleException() {
            super()
      }

      def BusinessRuleException(String msg) {
            super(msg)
      }

      def BusinessRuleException(Object objeto) {
            super()
            this.objeto = objeto
      }
}