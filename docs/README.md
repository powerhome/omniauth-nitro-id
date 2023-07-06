# omniauth-nitro-id

OmniAuth strategy for NitroID. To use it, you will need an OAuth2 Client ID and Secret. For more information, see the [NitroID user guide.](https://github.com/powerhome/nitro-id/blob/main/docs/user-guide.md)
## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-nitro-id'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-nitro-id

## Supported Ruby Versions

`omniauth-nitro-id` supports 2.7.4 and 3.1.2

## Usage

Example configuration
```ruby
config.omniauth :nitro_id, {
  client_options: {
      identifier: "CLIENT_ID",
      secret: "SECRET",
  }
}
```

Decoding NitroID's RSA256-encoded logout token
```ruby
token = params[:logout_token]
# eyJhbGciOiJSUzI1NiIsImtpZCI6InB1YmxpYzpoeWRyYS5vcGVuaWQuaWQtdG9rZW4iLCJ0eXAiOiJK...

OmniAuth::Strategies::NitroId.decode_logout_token(token)
# [{"aud"=>["196da0d5-adc6-4454-98f2-3cabae04855c"], "events"=>{"http://schemas.openid.net/event/backchannel-logout"=>{}}, "iat"=>1688672696, "iss"=>"https://id.powerhrg.com/" ...
```

Check out Power's [example Rails app](https://github.com/powerhome/example-rails-app) for details on how to use this gem with Devise.
