require 'active_record/base/data_type_for_manifest'
require "manifest/engine"
require 'friendly_id'
require 'sass-rails'
require 'compass-rails'

module Manifest
  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :data_types

    def initialize
      @data_types = []
    end
  end
end
