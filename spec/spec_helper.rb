$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ngpod_scraper'
require 'spec'
require 'spec/autorun'

include NgpodScraper

Spec::Runner.configure do |config|

end
