# Represents an individual site page, which has many {ContentBlock}s and has an associated template file.
class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  after_create :create_template
  after_update :rename_template
  after_destroy :remove_template

  validates :title, :slug, uniqueness: true
  validates :title, presence: true
  validates :slug, presence: true, on: :update

  has_many :content_blocks

  default_scope order('title')

  # @return [String] the path to the Page's template
  def template_path
    template_path_from_slug(slug)
  end

  private

  # Creates the template file after the Page is created.
  def create_template
    %x(touch #{self.template_path})
  end

  # Renames the template file after the Page is updated.
  def rename_template
    old_template_path = template_path_from_slug(slug_was)
    %x(mv #{old_template_path} #{template_path})
  end

  # Removes the template file after the Page is destroyed.
  def remove_template
    %x(rm #{template_path})
  end

  # Generates a Page template path given a slug.
  # @param [String] slug a Page object's slug attribute.
  # @return [String] the path to a Page's template based on the given slug.
  def template_path_from_slug(slug)
    "#{Rails.root}/app/views/pages/#{slug}.html.erb"
  end
end
