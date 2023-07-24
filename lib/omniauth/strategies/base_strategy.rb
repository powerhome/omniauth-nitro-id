# frozen_string_literal: true

require "omniauth_openid_connect"
require_relative "../../extensions/discovery"

module OmniAuth
  module Strategies
    class BaseStrategy < OmniAuth::Strategies::OpenIDConnect
      def public_key
        @public_key ||= if options.discovery
                          config.jwks
                        elsif key_or_secret
                          key_or_secret
                        elsif client_options.jwks_uri
                          fetch_key
                        end
      end

      def self.decode_logout_token(token)
        jwks = fetch_jwks
        JSON::JWT.decode(token, jwks)
      end

      def self.fetch_jwks
        key = ::OpenIDConnect.http_client.get("#{default_options[:issuer]}.well-known/jwks.json").body
        json = key.is_a?(String) ? JSON.parse(key) : key
        return JSON::JWK::Set.new(json["keys"]) if json.key?("keys")

        JSON::JWK.new(json)
      end

    private

      def fetch_key
        @fetch_key ||= parse_jwk_key(::OpenIDConnect.http_client.get_content(client_options.jwks_uri))
      end

      def key_or_secret
        @key_or_secret ||=
          case options.client_signing_alg&.to_sym
          when :HS256, :HS384, :HS512
            client_options.secret
          when :RS256, :RS384, :RS512
            parse_key
          end
      end

      def encoded_post_logout_redirect_uri
        return unless options.post_logout_redirect_uri

        query = {
          post_logout_redirect_uri: options.post_logout_redirect_uri,
        }
        query = query.merge({ id_token_hint: params["id_token_hint"] }) if params["id_token_hint"]

        URI.encode_www_form(query)
      end

      def parse_key
        if options.client_jwk_signing_key
          parse_jwk_key(options.client_jwk_signing_key)
        elsif options.client_x509_signing_key
          parse_x509_key(options.client_x509_signing_key)
        end
      end
    end
  end
end
