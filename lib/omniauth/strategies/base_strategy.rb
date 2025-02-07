# frozen_string_literal: true

require "omniauth_openid_connect"
require_relative "../../extensions/discovery"

module OmniAuth
  module Strategies
    class BaseStrategy < OmniAuth::Strategies::OpenIDConnect
      class APIError < StandardError; end
      class ClientCredentialsError < StandardError; end

      def public_key
        @public_key ||= if options.discovery
                          config.jwks
                        elsif key_or_secret
                          key_or_secret
                        elsif client_options.jwks_uri
                          fetch_key
                        end
      end

      def client
        super
      rescue AttrRequired::AttrMissing
        raise ClientCredentialsError,
              "#{options[:name].camelize} client credentials not found. Please check your environment."
      end

      def self.decode_logout_token(token)
        jwks = fetch_jwks
        JSON::JWT.decode(token, jwks)
      end

      def self.fetch_jwks
        key = ::OpenIDConnect.http_client.get("#{options[:issuer]}/.well-known/jwks.json").body
        json = key.is_a?(String) ? JSON.parse(key) : key
        return JSON::JWK::Set.new(json["keys"]) if json.key?("keys")

        JSON::JWK.new(json)
      end

      def self.refresh_token(refresh_token, client_id, client_secret)
        uri = URI.parse("#{default_options[:issuer]}/oauth2/token")

        request = Net::HTTP::Post.new(uri)
        request.basic_auth(client_id, client_secret)
        request.set_form_data(
          grant_type: "refresh_token",
          refresh_token: refresh_token
        )

        response = Net::HTTP.start(uri.hostname, uri.port, { use_ssl: uri.scheme == "https" }) do |http|
          http.request(request)
        end

        raise APIError, "API Error: #{response.code}" if response.code.to_i >= 400

        JSON.parse(response.body)
      end

      def self.introspect_token(token, api_key)
        options = {
          header: { Authorization: api_key },
          body: { token: token },
        }

        response = ::OpenIDConnect.http_client.post("#{options[:issuer]}/api/tokens/introspect", **options)

        raise APIError, "#{options[:name]} error: #{response.status}" if response.status.to_i >= 400

        JSON.parse(response.body)
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
