module Manifest
  # Searches for models containing the {ActiveRecord::Base#data_type_for_manifest}
  # and touches them so that #data_type_for_manifest is called at app initialization.
  def self.add_app_models_to_manifest_data_types
    models = Dir.glob("#{Rails.root}/app/models/*")

    models.each do |m|
      klass = nil
      acts_as_manifest = false

      File.open(m, 'r') do |f|
        if f.lines.to_a.select { |l| l =~ /data_type_for_manifest/ }.count > 0
          f.rewind
          f.lines.each do |l|
            if l =~ /ActiveRecord::Base/
              l.split('<')[0].split(' ')[1].strip.constantize
            end
          end
        end
      end
    end
  end
end
  
Manifest.add_app_models_to_manifest_data_types
