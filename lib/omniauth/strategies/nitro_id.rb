# frozen_string_literal: true

require "omniauth_openid_connect"

module OmniAuth
  module Strategies
    class NitroId < OmniAuth::Strategies::OpenIDConnect
      option :name, "nitro_id"
      option :discovery, true
      option :issuer, "https://id.powerhrg.com/"
      option :client_options, host: "id.powerhrg.com"
    end
  end
end
