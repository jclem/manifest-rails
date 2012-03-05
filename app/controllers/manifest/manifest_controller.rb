class Manifest::ManifestController < ApplicationController
  layout 'manifest'

  private

  def current_editor
    @current_editor ||= Editor.find(session[:editor_id]) if session[:editor_id]
  end

  helper_method :current_editor

  def authorize
    redirect_to manifest_login_url if current_editor.nil?
  end

  def authorize_admin
    redirect_to manifest_path, alert: 'Admins only' unless current_editor.admin?
  end
end
