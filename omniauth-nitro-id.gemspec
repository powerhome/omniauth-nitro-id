# frozen_string_literal: true

require File.expand_path("lib/omniauth/nitro_id/version", __dir__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-nitro-id"
  spec.version       = OmniAuth::NitroId::VERSION
  spec.authors       = ["Stephen Greer"]
  spec.email         = ["stephen.greer@powerhrg.com"]
  spec.summary       = "NitroID Strategy for OmniAuth."
  spec.description   = "NitroID Strategy for OmniAuth."
  spec.homepage      = "https://github.com/powerhome/omniauth-nitro-id"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth_openid_connect", "~> 0.4.0"
  spec.add_dependency "omniauth-rails_csrf_protection", "1.0.1"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "license_finder", ">= 7.0"
  spec.add_development_dependency "net-smtp"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "13.0.6"
  spec.add_development_dependency "rspec", "3.11.0"
  spec.add_development_dependency "rubocop", "1.31.1"
  spec.add_development_dependency "rubocop-powerhome", ">= 0.4.1"
end
