require 'faraday'
require File.expand_path('../version', __FILE__)

module FreeMusicArchive
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {FreeMusicArchive::API}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :api_key,
      :endpoint,
      :format,
      :user_agent,
      :proxy
    ].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default, don't set an application ID
    DEFAULT_API_KEY = nil

    # The endpoint that will be used to connect if none is set
    #
    # @note There is no reason to use any other endpoint at this time
    DEFAULT_ENDPOINT = 'http://freemusicarchive.org'.freeze

    # The response format appended to the path and sent in the 'Accept' header if none is set
    DEFAULT_FORMAT = :xml

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Free Music Archive Ruby Gem #{FreeMusicArchive::VERSION}".freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter        = DEFAULT_ADAPTER
      self.api_key        = DEFAULT_API_KEY
      self.endpoint       = DEFAULT_ENDPOINT
      self.format         = DEFAULT_FORMAT
      self.user_agent     = DEFAULT_USER_AGENT
      self.proxy          = DEFAULT_PROXY
    end
  end
end