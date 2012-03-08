require 'rails/generators/active_record'

# Creates templates and migrations for the initial Manifest install.
# Example:
#   rails generate manifest:install Page
# The "Page" argument is completely arbitrary.
class Manifest::InstallGenerator < ActiveRecord::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def generate_create_pages_migration
    migration_template 'create_pages.rb', 'db/migrate/create_pages.rb'
  end

  def generate_content_blocks_migratoin
    migration_template 'create_content_blocks.rb', 'db/migrate/create_content_blocks.rb'
  end

  def generate_add_index_to_pages_migration
    migration_template 'add_index_to_pages.rb', 'db/migrate/add_index_to_pages.rb'
  end

  def generate_add_index_to_content_blocks_migration
    migration_template 'add_index_to_content_blocks.rb', 'db/migrate/add_index_to_content_blocks.rb'
  end

  def generate_create_editors_migration
    migration_template 'create_editors.rb', 'db/migrate/create_editors.rb'
  end

  def create_pages_directory
    empty_directory 'app/views/pages'
  end

  def create_public_layout
    create_file 'app/views/layouts/public.html.erb'
  end

  def require_manifest_in_application_rb
    application_file = "#{Rails.root}/config/application.rb"

    File.open(application_file, 'r') do |f|
      sentinel = /Bundler.require/
      inject_into_file application_file, "require 'manifest'\n\n", before: sentinel
    end
  end

  def inject_assets_for_precompiling_in_application_rb
    line = "    config.assets.precompile += ['manifest/main.css', 'manifest/sessions.css', 'manifest/main.js']\n"
    application_file = "#{Rails.root}/config/application.rb"
    sentinel = /^ {2}end\nend/
    inject_into_file application_file, line, before: sentinel
  end
end

