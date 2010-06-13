require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "PhotoPage" do
  describe "new" do
    it "should set the url and config of the page" do
      url = 'file://spec/fixtures/hong-kong.html'
      config = {:show_logs => true}
      photo_page = PhotoPage.new(url, config)
      photo_page.url.should == url
      photo_page.config.should == config
    end
  end
end
