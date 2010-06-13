require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Client" do
  describe "new" do
    it "should convert the config's keys to symbols" do
      config = {'url' => "file://spec/fixtures/test.html", 'photo' => {'path_format' => 'test.jpg'}}

      client = NgpodScraper::Client.new(config)
      client.config[:url].should == config['url']
      client.config[:photo][:path_format].should == config['photo']['path_format']
    end
  end

  describe "run" do
    before :each do
      url = 'http://photography.nationalgeographic.com/photography/photo-of-the-day'
      FakeWeb.register_uri(:get, url, :body => 'spec/fixtures/test.html')

      photo_url = 'http://s.ngeo.com/wpf/media-live/photos/000/210/cache/istiqlal-mosque-jakarta_21078_990x742.jpg'
      FakeWeb.register_uri(:get, photo_url, :body => 'spec/fixtures/test.jpg')

      @config = {
        :url => url,
        :show_logs => false,
        :photo => {
          :path_format => 'tmp/#{year}-#{month}/#{day}-#{hour}.jpg',
          :wallpaper_path_format => 'tmp/photo-of-the-day.jpg',
          :wallpaper_width => 1280,
          :wallpaper_height => 800,
          :wallpaper_background_color => 'black'
        }
      }
    end

    it "should build a photo" do
      client = NgpodScraper::Client.new(@config)
      photo = client.run
      photo.should_not be_nil
    end

    it "should not do anything if the photo exists" do
      path = 'spec/fixtures/test.jpg'
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
      Pow("tmp/#{Time.now.strftime('%Y-%m')}/test.jpg").exists?.should be_false

      @config[:photo][:path_format] = path
      client = NgpodScraper::Client.new(@config)
      photo = client.run

      Pow("tmp/#{Time.now.strftime('%Y-%m')}/test.jpg").exists?.should be_true
    end

    it "should save the wallpaper if the photo does not exist" do
      path = 'tmp/test.jpg'

      wallpaper_path = 'tmp/wallpaper.jpg'
      Pow("tmp/wallpaper.jpg").exists?.should be_false

      @config[:photo][:path_format] = path
      @config[:photo][:wallpaper_path_format] = wallpaper_path

      client = NgpodScraper::Client.new(@config)
      photo = client.run

      Pow("tmp/wallpaper.jpg").exists?.should be_true
    end
  end
end
