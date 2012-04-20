require File.expand_path('../../../spec_helper', __FILE__)

describe FreeMusicArchive::Client do 
  
  before do
    @client = FreeMusicArchive::Client.new()
  end
  
  describe ".tracks" do
    before do
      stub_get("/api/get/tracks.xml").
        to_return(:body => fixture("tracks.xml"), :headers => {:content_type => "application/xml; charset=utf-8"})
    end
    
    it "should get the correct resource" do
      @client.tracks()
      a_get("/api/get/tracks.xml").should have_been_made
    end
    
    it "should have a title of tracks" do 
      response = @client.tracks()
      response.title.should == "Free Music Archive - Tracks"
    end
    
    it "should return an array of tracks" do
      response = @client.tracks()
      response.dataset.value.should be_an Array
      response.dataset.value.first["track_id"].should == "55860"
    end
  end
  
  describe ".tracks_by_artist" do
    before do
      stub_get("/api/get/tracks.xml?artist_handle=Arcade_Fire").
        to_return(:body => fixture("tracks_by_artist.xml"), :headers => {:content_type => "application/xml; charset=utf-8"})
    end
    
    it "should get the correct resource" do
      @client.tracks(:artist_handle => "Arcade_Fire")
      a_get("/api/get/tracks.xml").
        with(:query => {:artist_handle => "Arcade_Fire"}).
        should have_been_made
    end
    
    it "should return an array of tracks by :artist_handle => Arcade_Fire" do
      response = @client.tracks(:artist_handle => "Arcade_Fire")
      response.dataset.value.track_title.should == "Suburban War"
    end
  end
  
end
