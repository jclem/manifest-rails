class ActiveRecord::Base
  # Adds this instance of {ActiveRecord::Base} to Manifest.configuration.data_types.
  def self.data_type_for_manifest
    nav_name = ActiveSupport::Inflector.pluralize(self.to_s)
    route = "manifest_#{nav_name.underscore}_path"

    Manifest.configure do |config|
      config.data_types << { nav_name: ActiveSupport::Inflector.pluralize(self.to_s), route: route }
      config.data_types.uniq!
    end
  end
end
