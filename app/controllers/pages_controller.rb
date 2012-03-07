# The public-facing controller. Responsible for getting {Page} objects, collecting their {ContentBlock}s, and rendering their templates.
class PagesController < ApplicationController
  layout 'public'

  caches_page :show

  # Finds the requested {Page} or raises ActiveRecord::RecordNotFound.
  def show
    if @page = Page.find(params[:id])
      @content_blocks = @page.content_blocks
      render @page.slug
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end
