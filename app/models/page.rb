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

  def template_path
    template_path_from_slug(slug)
  end

  private

  def create_template
    %x(touch #{self.template_path})
  end

  def rename_template
    old_template_path = template_path_from_slug(slug_was)
    %x(mv #{old_template_path} #{template_path})
  end

  def remove_template
    %x(rm #{template_path})
  end

  def template_path_from_slug(slug)
    "#{Rails.root}/app/views/pages/#{slug}.html.erb"
  end
end
