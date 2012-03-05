class Manifest::ContentBlocksController < Manifest::ManifestController
  def index
    @content_blocks = ContentBlock.all
  end

  def show
    @content_block = ContentBlock.find(params[:id])
  end

  def new
    @content_block = ContentBlock.new(params[:content_block])
  end

  def create
    @content_block = ContentBlock.new(params[:content_block])

    if @content_block.save
      redirect_to manifest_content_blocks_path
    else
      render 'new'
    end
  end

  def edit
    @content_block = ContentBlock.find(params[:id])
  end

  def update
    @content_block = ContentBlock.find(params[:id])

    if @content_block.update_attributes(params[:content_block])
      redirect_to manifest_content_blocks_path
    else
      render 'edit'
    end
  end

  def destroy
    @content_block = ContentBlock.find(params[:id])
    @content_block.destroy

    redirect_to manifest_content_blocks_path
  end
end
