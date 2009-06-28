require File.dirname(__FILE__) + "/../spec_helper"

describe Discogs::Artist::Release do

  it "should map to artist" do
    Discogs::Artist::Release.element_name.should == :release
  end

  it "should map to plural releases" do
    Discogs::Artist::Release.plural_element_names.should == [ :releases ]
  end

  describe "when asking for artist-release information" do

    before do
      data = File.read(File.join(File.dirname(__FILE__), "..", "samples", "valid_artist_release.xml"))
      @artist_release = Discogs::Artist::Release.new(data)
      @artist_release.build!
    end

    it "should have a ID attribute" do
      @artist_release.id.should == "999333"
    end

    it "should have a status attribute" do
      @artist_release.status.should == "Accepted"
    end

    it "should have a type attribute" do
      @artist_release.type.should == "Main"
    end

    it "should have a title attribute" do
      @artist_release.title.should == "Temple of the Underworld"
    end

    it "should have a format attribute" do
      @artist_release.format.should == "LP"
    end
 
    it "should have a label attribute" do
      @artist_release.label.should == "Monitor Records"
    end
 
    it "should have a year attribute" do
      @artist_release.year.should == "1992"
    end
 
    it "should have a trackinfo attribute" do
      @artist_release.trackinfo.should be_nil
    end
 
  end

end
