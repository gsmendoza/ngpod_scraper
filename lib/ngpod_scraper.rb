gem 'pow', '>= 0.2.3'

require 'pow'
require 'rubygems'
require 'yaml'

require 'ngpod_scraper/client'
require 'ngpod_scraper/photo_page'

module NgpodScraper
  def self.client(path)
    config = YAML.load_file(path)
    Client.new(config)
  end
end
