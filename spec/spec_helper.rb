# frozen_string_literal: true

require "rspec"
require "omniauth"
require "omniauth-nitro-id"

RSpec.configure do |config|
  config.extend OmniAuth::Test::StrategyMacros, type: :strategy
end
