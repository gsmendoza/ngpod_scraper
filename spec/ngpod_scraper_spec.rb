require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "NgpodScraper" do
  describe "client(path)" do
    it "should return a client whose config is from the path" do
      path = 'spec/fixtures/config.yml'

      config = YAML.load_file(path)
      config.class.should == Hash
      config.empty?.should == false

      client = NgpodScraper.client(path)
      client.config.should == config
    end
  end
end
