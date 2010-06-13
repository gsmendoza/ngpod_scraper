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
      url = 'http://photography.nationalgeographic.com/photography/photo-of-the-day'
      FakeWeb.register_uri(:get, url, :body => 'spec/fixtures/hong-kong.html')

      photo_url = 'http://s.ngeo.com/wpf/media-live/photos/000/210/custom/21076_1600x1200-wallpaper-cb1276205884.jpg'
      FakeWeb.register_uri(:get, photo_url, :body => 'spec/fixtures/hong-kong.jpg')

      @config = {
        :url => url,
        :show_logs => false,
        :update_wallpaper => false,
        :photo => {
          :path_format => 'tmp/#{year}-#{month}/#{day}-#{hour}.jpg',
          :wallpaper_path_format => 'tmp/photo-of-the-day.jpg',
          :wallpaper_width => 1280,
          :wallpaper_height => 800
        }
      }
    end

    it "should build a photo" do
      client = NgpodScraper::Client.new(@config)
      photo = client.run
      photo.should_not be_nil
    end

    it "should not do anything if the photo exists" do
      path = 'spec/fixtures/hong-kong.jpg'
      @config[:path_format] = path
      Pow(path).exists?.should be_true

      photo = Photo.new(:file => Pow(path).open, :path_format => path)
      photo.should_not_receive(:save)

      client = NgpodScraper::Client.new(@config)
      client.should_receive(:get_photo).and_return(photo)

      client.run
    end

    it "should save the photo if the photo does not exist" do
      path = 'tmp/#{year}-#{month}/test.jpg'
      Pow(path).exists?.should be_false

      @config[:photo][:path_format] = path
      client = NgpodScraper::Client.new(@config)
      photo = client.run

      Pow("tmp/#{Time.now.strftime('%Y-%m')}/test.jpg").exists?.should be_true
    end

    it "should update the wallpaper if the photo does not exist and config[:update_wallpaper] is true"
  end
end
