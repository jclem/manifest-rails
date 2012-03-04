class PagesController < ApplicationController
  layout 'public'

  def show
    render @page.slug if @page = Page.find(params[:id])
  end
end
