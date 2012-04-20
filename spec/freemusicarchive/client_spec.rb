require File.expand_path('../../spec_helper', __FILE__)

describe FreeMusicArchive::Client do
  it "should connect using the endpoint configuration" do
    client = FreeMusicArchive::Client.new
    endpoint = URI.parse(client.endpoint)
    connection = client.send(:connection).build_url(nil).to_s
    (connection).should == endpoint.to_s
  end

end
