require File.expand_path('../spec_helper', __FILE__)

describe FreeMusicArchive do
  after do
    FreeMusicArchive.reset
  end

  describe ".client" do
    it "should be a FreeMusicArchive::Client" do
      FreeMusicArchive.client.should be_a FreeMusicArchive::Client
    end
  end

  describe ".adapter" do
    it "should return the default adapter" do
      FreeMusicArchive.adapter.should == FreeMusicArchive::Configuration::DEFAULT_ADAPTER
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      FreeMusicArchive.adapter = :typhoeus
      FreeMusicArchive.adapter.should == :typhoeus
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      FreeMusicArchive.endpoint.should == FreeMusicArchive::Configuration::DEFAULT_ENDPOINT
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      FreeMusicArchive.endpoint = 'http://twitter.com'
      FreeMusicArchive.endpoint.should == 'http://twitter.com'
    end
  end

  describe ".format" do
    it "should return the default format" do
      FreeMusicArchive.format.should == FreeMusicArchive::Configuration::DEFAULT_FORMAT
    end
  end

  describe ".format=" do
    it "should set the format" do
      FreeMusicArchive.format = 'json'
      FreeMusicArchive.format.should == 'json'
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      FreeMusicArchive.user_agent.should == FreeMusicArchive::Configuration::DEFAULT_USER_AGENT
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      FreeMusicArchive.user_agent = 'Custom User Agent'
      FreeMusicArchive.user_agent.should == 'Custom User Agent'
    end
  end

  describe ".configure" do

    FreeMusicArchive::Configuration::VALID_OPTIONS_KEYS.each do |key|

      it "should set the #{key}" do
        FreeMusicArchive.configure do |config|
          config.send("#{key}=", key)
          FreeMusicArchive.send(key).should == key
        end
      end
    end
  end
end
