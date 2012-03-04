require 'rails/generators/active_record'

class Manifest::InstallGenerator < ActiveRecord::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def generate_create_pages_migration
    migration_template 'create_pages.rb', 'db/migrate/create_pages.rb'
  end

  def create_pages_directory
    empty_directory 'app/views/pages'
  end

  def create_public_layout
    create_file 'app/views/layouts/public.html.erb'
  end
end

