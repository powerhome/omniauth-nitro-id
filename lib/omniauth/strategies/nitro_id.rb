# frozen_string_literal: true

require_relative "base_strategy"

module OmniAuth
  module Strategies
    class NitroId < BaseStrategy
      option :name, "nitro_id"
      option :discovery, true
      option :issuer, "https://id.powerhrg.com/"
      option :client_options, host: "id.powerhrg.com"
    end
  end
end
