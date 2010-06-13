require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "PhotoPage" do
  describe "new" do
    it "should set the url and config of the page" do
      url = 'http://photography.nationalgeographic.com/photography/photo-of-the-day'
      config = {:show_logs => true}
      photo_page = PhotoPage.new(url, config)
      photo_page.url.should == url
      photo_page.config.should == config
    end
  end

  describe "photo" do
    it "should get the photo of the day from the page" do
      url = 'http://photography.nationalgeographic.com/photography/photo-of-the-day'
      FakeWeb.register_uri(:get, url, :body => 'spec/fixtures/test.html')

      photo_url = 'http://s.ngeo.com/wpf/media-live/photos/000/210/cache/istiqlal-mosque-jakarta_21078_990x742.jpg'
      FakeWeb.register_uri(:get, photo_url, :body => 'spec/fixtures/test.jpg')

      photo_page = PhotoPage.new(url)
      photo = photo_page.photo

      photo.should be_a(Photo)
    end
  end

  describe "photo_url" do
    it "should be the url of the photo of the day in the page" do
      url = 'http://photography.nationalgeographic.com/photography/photo-of-the-day'
      body = Pow('spec/fixtures/test.html').open.read
      FakeWeb.register_uri(:get, url, :body => body)

      photo_page = PhotoPage.new(url)
      photo_page.photo_url.gsub(/\s+/, '').length.should > 0
    end
  end
end
