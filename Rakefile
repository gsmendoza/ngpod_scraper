require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ngpod-scraper"
    gem.summary = "National Geographic Photo of the Day Screen Scraper"
    gem.description = "A tool for scraping National Geographic's Photo of the Day"
    gem.email = "[gsmendoza@gmail.com]"
    gem.homepage = "http://github.com/gsmendoza/ngpod-scraper"
    gem.authors = ["George Mendoza"]
    gem.add_development_dependency "fakeweb", ">= 1.2.8"
    gem.add_development_dependency "rspec", ">= 1.3.0"

  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ngpod-scraper #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
