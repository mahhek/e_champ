$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'paperclip/version'

include_files = ["README*", "LICENSE", "Rakefile", "init.rb", "{lib,tasks,test,rails,generators,shoulda_macros}/**/*"].map do |glob|
  Dir[glob]
end.flatten
exclude_files = ["**/*.rbc", "test/s3.yml", "test/debug.log", "test/paperclip.db", "test/doc", "test/doc/*", "test/pkg", "test/pkg/*", "test/tmp", "test/tmp/*"].map do |glob|
  Dir[glob]
end.flatten

spec = Gem::Specification.new do |s|
  s.name              = "paperclip"
  s.version           = Paperclip::VERSION
  s.author            = "Jon Yurek"
  s.email             = "jyurek@thoughtbot.com"
  s.homepage          = "https://github.com/thoughtbot/paperclip"
  s.description       = "Easy upload management for ActiveRecord"
  s.platform          = Gem::Platform::RUBY
  s.summary           = "File attachments as attributes for ActiveRecord"
  s.files             = include_files - exclude_files
  s.require_path      = "lib"
  s.test_files        = Dir["test/**/test_*.rb"]
  s.rubyforge_project = "paperclip"
  s.extra_rdoc_files  = Dir["README*"]
  s.rdoc_options << '--line-numbers' << '--inline-source'
  s.requirements << "ImageMagick"
  s.add_dependency 'activerecord', '>=2.3.0'
  s.add_dependency 'activesupport', '>=2.3.2'
  s.add_dependency 'cocaine', '>=0.0.2'
  s.add_dependency 'mime-types'
  s.add_development_dependency 'shoulda'
  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'aws-s3'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'capybara'
end
