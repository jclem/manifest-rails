class ContentBlock < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :slug, uniqueness: true
  validates :title, presence: true
  validates :slug, presence: true, on: :update

  belongs_to :page

  default_scope includes(:page).order('pages.title')

  def render
    if allow_html
      content.html_safe
    else
      content
    end
  end
end
