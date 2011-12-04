# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ngpod_scraper/version"

Gem::Specification.new do |s|
  s.name        = "ngpod_scraper"
  s.version     = NgpodScraper::VERSION
  s.authors     = ["George Mendoza"]
  s.email       = ["gsmendoza@gmail.com"]
  s.homepage    = "http://github.com/gsmendoza/ngpod_scraper"
  s.summary     = %q{National Geographic Photo of the Day Screen Scraper}
  s.description = %q{A tool for scraping National Geographic's Photo of the Day}

  s.rubyforge_project = "ngpod_scraper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "fakeweb", "~> 1.2.8"
  s.add_development_dependency "rspec", "~> 1.3.0"

  s.add_runtime_dependency "nokogiri", ">= 1.4.2"
  s.add_runtime_dependency "pow", ">= 0.2.3"
  s.add_runtime_dependency "rmagick", ">= 2.13.1"
  s.add_runtime_dependency "valuable", ">= 0.8.2"
end
