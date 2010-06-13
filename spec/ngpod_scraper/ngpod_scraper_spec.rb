require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "NgpodScraper" do
  describe "client(path)" do
    it "should return a client whose config is from the path" do
      path = 'spec/fixtures/config.yml'

      config = YAML.load_file(path)
      config.should be_a(Hash)
      config.should_not be_empty

      client = NgpodScraper.client(path)
      client.config[:url].should == config['url']
      client.config[:photo][:path_format].should == config['photo']['path_format']
    end
  end
end
