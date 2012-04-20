require File.expand_path('../../../spec_helper', __FILE__)

describe FreeMusicArchive::Client do 
  
  before do
    @client = FreeMusicArchive::Client.new()
  end
  
  describe ".albums" do
    before do
      stub_get("/api/get/albums.xml").
        to_return(:body => fixture("albums.xml"), :headers => {:content_type => "application/xml; charset=utf-8"})
    end
    
    it "should get the correct resource" do
      @client.albums()
      a_get("/api/get/albums.xml").should have_been_made
    end
    
    it "should have a title of albums" do 
      response = @client.albums()
      response.title.should == "Free Music Archive - Albums"
    end
    
    it "should return an array of albums" do
      response = @client.albums()
      response.dataset.value.should be_an Array
      response.dataset.value.first["album_id"].should == "7596"
    end
  end
  
  describe ".albums_by_artist" do
    before do
      stub_get("/api/get/albums.xml?artist_handle=Arcade_Fire").
        to_return(:body => fixture("albums_by_artist.xml"), :headers => {:content_type => "application/xml; charset=utf-8"})
    end
    
    it "should get the correct resource" do
      @client.albums(:artist_handle => "Arcade_Fire")
      a_get("/api/get/albums.xml").
        with(:query => {:artist_handle => "Arcade_Fire"}).
        should have_been_made
    end
    
    it "should return an array of albums by :artist_handle => Arcade_Fire" do
      response = @client.albums(:artist_handle => "Arcade_Fire")
      response.dataset.value.should be_an Array
      response.dataset.value.first["album_title"].should == "Arcade Fire Live on CBC Radio 3 03/13/2006"
    end
  end
  
  
end
