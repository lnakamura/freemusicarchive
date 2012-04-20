require File.expand_path('../../../spec_helper', __FILE__)

describe FreeMusicArchive::Client do 
  
  before do
    @client = FreeMusicArchive::Client.new()
  end
  
  describe ".genres" do
    
    before do
      stub_get("/api/get/genres.xml").
        to_return(:body => fixture("genres.xml"), :headers => {:content_type => "application/xml; charset=utf-8"})
    end
    
    it "should get the correct resource" do
      @client.genres()
      a_get("/api/get/genres.xml").should have_been_made
    end
    
    it "should have a title of genres" do 
      response = @client.genres()
      response.title.should == "Free Music Archive - Genres"
    end
    
    it "should return an array of genres" do
      response = @client.genres()
      response.dataset.value.should be_an Array
      response.dataset.value.first["genre_id"].should == "1"
    end
    
  end
end
