# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ngpod-scraper}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George Mendoza"]
  s.date = %q{2010-06-13}
  s.default_executable = %q{ngpod_scraper}
  s.description = %q{A tool for scraping National Geographic's Photo of the Day}
  s.email = %q{[gsmendoza@gmail.com]}
  s.executables = ["ngpod_scraper"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "bin/ngpod_scraper",
     "lib/ngpod_scraper.rb",
     "lib/ngpod_scraper/client.rb",
     "lib/ngpod_scraper/ngpod_scraper.rb",
     "lib/ngpod_scraper/photo.rb",
     "lib/ngpod_scraper/photo_page.rb",
     "ngpod-scraper.gemspec",
     "spec/fixtures/config.yml",
     "spec/fixtures/test.html",
     "spec/fixtures/test.jpg",
     "spec/ngpod_scraper/client_spec.rb",
     "spec/ngpod_scraper/ngpod_scraper_spec.rb",
     "spec/ngpod_scraper/photo_page_spec.rb",
     "spec/ngpod_scraper/photo_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/gsmendoza/ngpod-scraper}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{National Geographic Photo of the Day Screen Scraper}
  s.test_files = [
    "spec/ngpod_scraper/photo_spec.rb",
     "spec/ngpod_scraper/client_spec.rb",
     "spec/ngpod_scraper/ngpod_scraper_spec.rb",
     "spec/ngpod_scraper/photo_page_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.2"])
      s.add_runtime_dependency(%q<pow>, [">= 0.2.3"])
      s.add_runtime_dependency(%q<rmagick>, [">= 2.13.1"])
      s.add_runtime_dependency(%q<valuable>, [">= 0.8.2"])
      s.add_development_dependency(%q<fakeweb>, [">= 1.2.8"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.4.2"])
      s.add_dependency(%q<pow>, [">= 0.2.3"])
      s.add_dependency(%q<rmagick>, [">= 2.13.1"])
      s.add_dependency(%q<valuable>, [">= 0.8.2"])
      s.add_dependency(%q<fakeweb>, [">= 1.2.8"])
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.4.2"])
    s.add_dependency(%q<pow>, [">= 0.2.3"])
    s.add_dependency(%q<rmagick>, [">= 2.13.1"])
    s.add_dependency(%q<valuable>, [">= 0.8.2"])
    s.add_dependency(%q<fakeweb>, [">= 1.2.8"])
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
  end
end

