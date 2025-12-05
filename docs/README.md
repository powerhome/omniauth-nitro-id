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

Check out Power's [example Rails app](https://github.com/powerhome/example-rails-app) for details on how to use this gem with Devise.
