require File.expand_path('../../../spec_helper', __FILE__)

describe FreeMusicArchive::Client do 
  
  before do
    @client = FreeMusicArchive::Client.new()
  end
  
  describe ".artists" do
    
    before do
      stub_get("/api/get/artists.xml").
        to_return(:body => fixture("artists.xml"), :headers => {:content_type => "application/xml; charset=utf-8"})
    end
    
    it "should get the correct resource" do
      @client.artists()
      a_get("/api/get/artists.xml").should have_been_made
    end
    
    it "should have a title of artists" do 
      response = @client.artists()
      response.title.should == "Free Music Archive - Artists"
    end
    
    it "should return an array of artists" do
      response = @client.artists()
      response.dataset.value.should be_an Array
      response.dataset.value.first["artist_id"].should == "365"
    end
    
  end
end
