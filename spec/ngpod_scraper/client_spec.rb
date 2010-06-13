require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Client" do
  describe "new" do
    it "should set the the client's config" do
      config = {:url => "file://spec/fixtures/hong-kong.html"}

      client = NgpodScraper::Client.new(config)
      client.config.should == config
    end
  end

  describe "run" do
    before :each do
      @config = {
        :url => "file://spec/fixtures/hong-kong.html",
        :show_logs => false,
        :update_wallpaper => false,
        :photo => {
          :path_format => 'spec/tmp/#{f.name}',
          :wallpaper_path_format => 'spec/tmp/photo-of-the-day.jpg',
          :wallpaper_width => 1280,
          :wallpaper_height => 800
        }
      }
    end

    it "should build a photo" do
      pending
      client = NgpodScraper::Client.new(@config)
      photo = client.run
      photo.should_not be_nil
    end

    it "should not do anything if the photo exists"
    it "should save the photo if the photo does not exist"
    it "should update the wallpaper if the photo does not exist and config[:update_wallpaper] is true"
  end
end
