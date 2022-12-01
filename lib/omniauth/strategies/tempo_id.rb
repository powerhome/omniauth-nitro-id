# frozen_string_literal: true

require "omniauth_openid_connect"

module OmniAuth
  module Strategies
    class TempoId < OmniAuth::Strategies::OpenIDConnect
      DEFAULT_STRATEGY_NAME = "tempo_id"
      DEFAULT_ISSUER = "https://id.streamfinancial.io/"
      DEFAULT_HOST = "id.streamfinancial.io"

      option :name, DEFAULT_STRATEGY_NAME
      option :discovery, true
      option :issuer, DEFAULT_ISSUER
      option :client_options, host: DEFAULT_HOST
    end
  end
end
