require 'saml_idp/assertion_builder'
require 'saml_idp/response_builder'
module SamlIdp
  class LogoutResponse
    attr_accessor :assertion_with_signature
    attr_accessor :reference_id
    attr_accessor :response_id
    attr_accessor :issuer_uri
    attr_accessor :audience_uri
    attr_accessor :saml_request_id
    attr_accessor :saml_destination
    attr_accessor :algorithm
    attr_accessor :secret_key
    attr_accessor :x509_certificate

    def initialize(reference_id,
          response_id,
          issuer_uri,
          saml_request_id,
          saml_destination,
          algorithm
          )
      self.reference_id = reference_id
      self.response_id = response_id
      self.issuer_uri = issuer_uri
      self.saml_request_id = saml_request_id
      self.saml_destination = saml_destination
      self.algorithm = algorithm
      self.secret_key = secret_key
      self.x509_certificate = x509_certificate
    end

    def build
      @built ||= response_builder.encoded
    end

    def response_builder
      ResponseBuilder.new(response_id, issuer_uri, saml_destination, saml_request_id, '', 'LogoutResponse')
    end
    private :response_builder
  end
end
