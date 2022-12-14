# frozen_string_literal: true

require "omniauth_openid_connect"
require_relative "../../extensions/discovery"

module OmniAuth
  module Strategies
    class BaseStrategy < OmniAuth::Strategies::OpenIDConnect

      private

      def encoded_post_logout_redirect_uri
        return unless options.post_logout_redirect_uri

        query = {
          post_logout_redirect_uri: options.post_logout_redirect_uri
        }
        query.merge({ id_token_hint: params["id_token_hint"] }) if params["id_token_hint"]

        URI.encode_www_form(query)
      end
    end
  end
end
