require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Client" do
  describe "new" do
    it "should set the the client's config" do
      config = {
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

      client = NgpodScraper::Client.new(config)
      client.config.should == config
    end
  end
end
