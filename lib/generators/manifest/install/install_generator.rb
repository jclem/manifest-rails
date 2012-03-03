require 'rails/generators/active_record'

class Manifest::InstallGenerator < ActiveRecord::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def generate_create_pages_migration
    migration_template 'create_pages.rb', 'db/migrate/create_pages.rb'
  end
end

