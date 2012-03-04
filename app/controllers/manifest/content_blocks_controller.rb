class Manifest::ContentBlocksController < ApplicationController
  def index
    @content_blocks = ContentBlock.all
  end

  def show
    @content_block = ContentBlock.find(params[:id])
  end

  def new
    @content_block = ContentBlock.new
  end

  def create
    @content_block = ContentBlock.new(params[:content_block])

    if @content_block.save
      redirect_to manifest_content_blocks_path
    else
      render 'new'
    end
  end

  def destroy
    @content_block = ContentBlock.find(params[:id])
    @content_block.destroy

    redirect_to manifest_content_blocks_path
  end
end
