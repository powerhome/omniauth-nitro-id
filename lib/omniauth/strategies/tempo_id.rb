# frozen_string_literal: true

require_relative "base_strategy"

module OmniAuth
  module Strategies
    class TempoId < BaseStrategy
      ISSUER = "https://id.streamfinancial.io/"

      option :name, "tempo_id"
      option :discovery, true
      option :issuer, ISSUER
      option :client_options, host: "id.streamfinancial.io"
    end
  end
end
