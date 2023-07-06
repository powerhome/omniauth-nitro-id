# frozen_string_literal: true

require_relative "base_strategy"

module OmniAuth
  module Strategies
    class NitroId < BaseStrategy
      ISSUER = "https://id.powerhrg.com/"

      option :name, "nitro_id"
      option :discovery, true
      option :issuer, ISSUER
      option :client_options, host: "id.powerhrg.com"
    end
  end
end
