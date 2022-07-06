# frozen_string_literal: true

require "omniauth_openid_connect"

module OmniAuth
  module Strategies
    class NitroId < OmniAuth::Strategies::OpenIDConnect
      DEFAULT_STRATEGY_NAME = "nitro_id"
      DEFAULT_ISSUER = "https://id.powerhrg.com/"
      DEFAULT_HOST = "id.powerhrg.com"

      option :name, DEFAULT_STRATEGY_NAME
      option :discovery, true
      option :issuer, DEFAULT_ISSUER
      option :client_options, host: DEFAULT_HOST
    end
  end
end
