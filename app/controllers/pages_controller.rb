class PagesController < ApplicationController
  layout 'public'

  caches_page :show

  def show
    if @page = Page.find(params[:id])
      @content_blocks = @page.content_blocks
      render @page.slug
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
