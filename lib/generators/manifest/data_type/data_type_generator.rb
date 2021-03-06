require 'rails/generators/active_record'

# Creates templates and migrations for custom Manifest data types.
# Example:
#   rails generate manifest:data_type Person first_name:string last_name:string
class Manifest::DataTypeGenerator < ActiveRecord::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :attributes, type: :array, default: [], banner: 'field:type field:type'

  def generate_data_type_migration
    migration_template 'migration.rb', "#{Rails.root}/db/migrate/create_#{table_name}.rb"
  end

  def generate_data_type_form_partial
    template '_form.html.erb', "#{Rails.root}/app/views/manifest/#{table_name}/_form.html.erb"
  end

  def generate_data_type_new_view
    template 'new.html.erb', "#{Rails.root}/app/views/manifest/#{table_name}/new.html.erb"
  end

  def generate_data_type_edit_view
    template 'edit.html.erb', "#{Rails.root}/app/views/manifest/#{table_name}/edit.html.erb"
  end

  def create_index_view
    template 'index.html.erb', "#{Rails.root}/app/views/manifest/#{table_name}/index.html.erb"
  end

  def create_manifest_namespace_in_routes_if_it_does_not_exist
    route_file = "#{Rails.root}/config/routes.rb"
    File.open(route_file, 'r') do |f|
      if f.lines.to_a.find_index { |l| l =~ /^\s*namespace :manifest do/ }
        return
      else
        sentinel = /\.routes.draw do\s*$/
        inject_into_file route_file, "\n  namespace :manifest do\n  end", { after: sentinel }
      end
    end
  end

  def inject_data_type_route_into_routes
    route_file = "#{Rails.root}/config/routes.rb"
    sentinel = /^\s*namespace :manifest do/

    plural_name = ActiveSupport::Inflector.pluralize(name.underscore)

    inject_into_file route_file, "\n    resources :#{plural_name}", { after: sentinel}
  end

  def create_model_file
    template 'model.rb', "#{Rails.root}/app/models/#{name.underscore}.rb"
  end

  def create_controller_file
    plural_name = ActiveSupport::Inflector.pluralize(name)

    template 'controller.rb', "#{Rails.root}/app/controllers/manifest/#{plural_name.underscore}_controller.rb"
  end
end
