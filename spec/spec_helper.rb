$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'fakeweb'
require 'ngpod_scraper'
require 'spec'
require 'spec/autorun'

include NgpodScraper

Spec::Runner.configure do |config|
  config.before :suite do
    FakeWeb.allow_net_connect = false
  end

  config.before :each do
    Pow('tmp').delete! if Pow('tmp').exists?
    FakeWeb.clean_registry
  end
end
