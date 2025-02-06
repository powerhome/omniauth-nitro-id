# frozen_string_literal: true

require_relative "base_strategy"

module OmniAuth
  module Strategies
    class NitroId < BaseStrategy
      option :name, "nitro_id"
      option :discovery, true
      option :issuer, "https://pr1609.nitro-id.beta.px.powerapp.cloud"
      option :client_options, host: "pr1609.nitro-id.beta.px.powerapp.cloud"
    end
  end
end
