# frozen_string_literal: true

require_relative "base_strategy"

module OmniAuth
  module Strategies
    class NitroId < BaseStrategy
      option :name, "nitro_id"
      option :discovery, true
      option :issuer, "https://pr1604.nitro-id.beta.hq.powerapp.cloud"
      option :client_options, host: "pr1604.nitro-id.beta.hq.powerapp.cloud"
    end
  end
end
