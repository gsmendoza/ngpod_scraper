require 'ngpod_scraper'
require 'bundler/setup'
require 'fakeweb'

include NgpodScraper

Spec::Runner.configure do |config|
  config.before :suite do
    FakeWeb.allow_net_connect = false
  end

  config.after :each do
    Pow('tmp').delete! if Pow('tmp').exists?
    FakeWeb.clean_registry
  end
end
