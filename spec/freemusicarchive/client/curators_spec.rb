require File.expand_path('../../../spec_helper', __FILE__)

describe FreeMusicArchive::Client do 
  
  before do
    @client = FreeMusicArchive::Client.new()
  end
  
  describe ".curators" do
    
    before do
      stub_get("/api/get/curators.xml").
        to_return(:body => fixture("curators.xml"), :headers => {:content_type => "application/xml; charset=utf-8"})
    end
    
    it "should get the correct resource" do
      @client.curators()
      a_get("/api/get/curators.xml").should have_been_made
    end
    
    it "should have a title of curators" do 
      response = @client.curators()
      response.title.should == "Free Music Archive - Curators"
    end
    
    it "should return an array of curators" do
      response = @client.curators()
      response.dataset.value.should be_an Array
      response.dataset.value.first["curator_id"].should == "1"
      response.dataset.value.last["curator_id"].should == "43"
    end
    
  end
end
