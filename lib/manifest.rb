require 'active_record/base/data_type_for_manifest'
require "manifest/engine"
require 'friendly_id'
require 'sass-rails'
require 'compass-rails'
require 'tinymce-rails'

module Manifest
  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :data_types, :app_name

    def initialize
      @data_types = []
      @app_name = 'Manifest'
    end
  end
end
