# frozen_string_literal: true

require "rspec"
require "omniauth"
require "omniauth_openid_connect"
require "omniauth_nitro_id"

RSpec.configure do |config|
  config.extend OmniAuth::Test::StrategyMacros, type: :strategy
end
