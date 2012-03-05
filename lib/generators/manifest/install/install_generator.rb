require 'rails/generators/active_record'

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
end

