class PagesController < ApplicationController
  layout 'public'

  caches_page :show

  def show
    render @page.slug if @page = Page.find(params[:id])
  end
end
