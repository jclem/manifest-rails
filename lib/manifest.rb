require 'active_record/base/data_type_for_manifest'
require "manifest/engine"
require 'friendly_id'
require 'sass-rails'
require 'compass-rails'
require 'tinymce-rails'

# The primary Manifest namespace. Note that {Page}, {Editor}, and {ContentBlock} are not namespaced models.
module Manifest
  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  # App configuration, which can be altered in config/initializers/manifest.rb
  # Example:
  #   Manifest.configure do |config|
  #     config.app_name = "My App"
  #   end
  class Configuration
    attr_accessor :data_types, :app_name

    def initialize
      @data_types = []
      @app_name = 'Manifest'
    end
  end
end
