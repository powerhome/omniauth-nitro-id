# frozen_string_literal: true

module Extensions
  module Discovery
    Module.new do
      # Monkey patch allow HTTP instead of forcing HTTPS for discovery.

      attr_reader :scheme

      def initialize(uri)
        @scheme = uri.scheme
        super
      end

      def endpoint
        URI::Generic.build(scheme: scheme, host: host, port: port, path: path)
      rescue URI::Error => e
        raise SWD::Exception, e.message
      end

      prepend_features(::OpenIDConnect::Discovery::Provider::Config::Resource)
    end
  end
end
