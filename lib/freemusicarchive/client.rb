require 'freemusicarchive/configuration'
require 'freemusicarchive/request'

module FreeMusicArchive
  class Client
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
    
    include FreeMusicArchive::Request
    
    include FreeMusicArchive::Client::Albums
    include FreeMusicArchive::Client::Artists
    include FreeMusicArchive::Client::Curators
    include FreeMusicArchive::Client::Genres
    include FreeMusicArchive::Client::Tracks
    
    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    
    # Initializes a new API object
    #
    # @param attrs [Hash]
    # @return [FreeMusicArchive::Client]
    def initialize(attrs={})
      attrs = FreeMusicArchive.options.merge(attrs)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end
    
  end

end