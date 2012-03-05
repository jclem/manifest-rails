class Manifest::SessionsController < ApplicationController
  layout 'manifest/sessions'

  def new
  end

  def create
    editor = Editor.find_by_email(params[:email])

    if editor && editor.authenticate(params[:password])
      session[:editor_id] = editor.id
      redirect_to manifest_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:editor_id] = nil
    redirect_to new_manifest_session_path
  end
end
