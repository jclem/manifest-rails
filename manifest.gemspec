$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "manifest/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "manifest-rails"
  s.version     = Manifest::VERSION
  s.authors     = ["Jonathan Clem"]
  s.email       = ["j@jclem.net"]
  s.homepage    = "http://github.com/jclem/manifest-rails"
  s.summary     = "Manifest is a Rails Engine content management system"
  s.description = "Manifest allows for the creation of simple content management with support for easy custom data types. It attempts to preserve the Rails way of working where possible."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency 'friendly_id'
  s.add_dependency 'sass-rails', '~> 3.2.3'
  s.add_dependency 'compass-rails'
  s.add_dependency 'bcrypt-ruby', '~> 3.0.0'
  s.add_dependency 'tinymce-rails'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
end
