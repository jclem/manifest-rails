class Manifest::PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])

    if @page.save
      redirect_to manifest_pages_path
    else
      render 'new'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to manifest_pages_path
  end
end
