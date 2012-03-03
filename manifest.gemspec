$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "manifest/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "manifest-rails"
  s.version     = Manifest::VERSION
  s.authors     = ["Jonathan Clem"]
  s.email       = ["j@jclem.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Manifest."
  s.description = "TODO: Description of Manifest."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.2"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
end
