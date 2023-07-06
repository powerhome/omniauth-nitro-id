# frozen_string_literal: true

require_relative "base_strategy"

module OmniAuth
  module Strategies
    class TempoId < BaseStrategy
      option :name, "tempo_id"
      option :discovery, true
      option :issuer, "https://id.streamfinancial.io/"
      option :client_options, host: "id.streamfinancial.io"
    end
  end
end
