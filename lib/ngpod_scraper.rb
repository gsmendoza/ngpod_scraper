gem 'pow', '>= 0.2.3'

require 'pow'
require 'rubygems'
require 'yaml'

require 'ngpod_scraper/client'

module NgpodScraper
  def self.client(path)
    config = YAML.load_file(path)
    Client.new(config)
  end
end
