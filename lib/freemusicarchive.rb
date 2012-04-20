# Core modules
require File.expand_path('../freemusicarchive/client', __FILE__)
require File.expand_path('../freemusicarchive/configuration', __FILE__)

module FreeMusicArchive
  extend Configuration
  
  class << self
  
    # Alias for FreeMusicArchive::Client.new
    #
    # @return [FreeMusicArchive::Client]
    def client (options={})
      FreeMusicArchive::Client.new(options)
    end
  
    # Delegate to FreeMusicArchive::Client
    def method_missing(method, *args, &block)
      return super unless client.respond_to?(method)
      client.send(method, *args, &block)
    end

    # Delegate to FreeMusicArchive::Client
    def respond_to?(method)
      return client.respond_to?(method) || super
    end
  
  end
  
end