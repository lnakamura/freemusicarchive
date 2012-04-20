require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module FreeMusicArchive
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={}, unformatted=false)
      response = connection.get do |req|
        req.url(formatted_path(path), options)
        if api_key != nil
          req.params['api_key'] = api_key
        end
      end
      response.body.data
    end

    private

    def formatted_path(path)
      [path, format].compact.join('.')
    end
  
    def connection()
      options = {
        :headers => {:accept => "application/#{format}; charset=utf-8", :user_agent => user_agent},
        :proxy => proxy,
        :ssl => { :verify => false },
        :url => endpoint,
      }
      
      Faraday.new(options) do |builder|
        #builder.use Faraday::Response::Logger
        builder.use Faraday::Request::UrlEncoded
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseXml
        builder.adapter(adapter)
        builder.use FaradayMiddleware::RaiseHttpException
      end
    end
    
  end
end
