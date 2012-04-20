require File.expand_path('../../spec_helper', __FILE__)

describe FreeMusicArchive::Client do
  
  before do
    @keys = FreeMusicArchive::Configuration::VALID_OPTIONS_KEYS
  end
  
  context "with module configuration" do

    before do
      FreeMusicArchive.configure do |config|
        @keys.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    after do
      FreeMusicArchive.reset
    end

    it "should inherit module configuration" do
      api = FreeMusicArchive::Client.new
      @keys.each do |key|
        api.send(key).should == key
      end
    end

    context "with class configuration" do

      before do
        @configuration = {
          :adapter => :typhoeus,
          :api_key => 'API',
          :endpoint => 'http://twitter.com/',
          :format => :xml,
          :proxy => 'http://idiofox555:sekret@proxy.example.com:8080',
          :user_agent => 'Custom User Agent',
        }
      end

      context "during initialization" do

        it "should override module configuration" do
          api = FreeMusicArchive::Client.new(@configuration)
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end

      context "after initilization" do

        it "should override module configuration after initialization" do
          api = FreeMusicArchive::Client.new
          @configuration.each do |key, value|
            api.send("#{key}=", value)
          end
          @keys.each do |key|
            api.send(key).should == @configuration[key]
          end
        end
      end
    end
  end
  
  it "should connect using the endpoint configuration" do
    client = FreeMusicArchive::Client.new
    endpoint = URI.parse(client.endpoint)
    connection = client.send(:connection).build_url(nil).to_s
    (connection).should == endpoint.to_s
  end

end
