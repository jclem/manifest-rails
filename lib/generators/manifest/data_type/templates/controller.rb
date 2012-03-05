class Manifest::<%= ActiveSupport::Inflector.pluralize(name) %>Controller < ApplicationController
  before_filter :authorize

  layout 'manifest'

  # Add more actions to me!

  def index
    @<%= plural_name.underscore %> = <%= name %>.all
  end
end
