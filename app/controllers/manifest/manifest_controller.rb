# The primary Manifest admin controller. Mostly used for determining {#current_editor} and for authorization.
class Manifest::ManifestController < ApplicationController
  before_filter :authorize

  layout 'manifest/manifest'

  private

  # @return [Editor] the currently signed-in {Editor}, or nil.
  def current_editor
    @current_editor ||= Editor.find(session[:editor_id]) if session[:editor_id]
  end

  helper_method :current_editor

  # Redirects to login if {#current_editor} is nil.
  def authorize
    redirect_to manifest_login_url if current_editor.nil?
  end

  # Used to protect sensitive {Page} and {ContentBlock} actions from non-admin {Editor}s.
  def authorize_admin
    redirect_to manifest_path, alert: 'Admins only' unless current_editor.admin?
  end

  # Expires the cached version of every {Page} object view.
  def expire_all_pages
    expire_page '/index.html'

    Page.all.each do |p|
      expire_page "/#{p.slug}.html"
    end
  end
end
