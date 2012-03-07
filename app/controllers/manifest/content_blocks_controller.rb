# Controls CRUD actions for {ContentBlock} objects.
class Manifest::ContentBlocksController < Manifest::ManifestController
  before_filter :authorize_admin, except: [:index, :edit, :update]

  def index
    @content_blocks = ContentBlock.all
  end

  def new
    @content_block = ContentBlock.new(content_block_params)
  end

  def create
    @content_block = ContentBlock.new(content_block_params)

    if @content_block.save
      expire_all_pages
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

    if @content_block.update_attributes(content_block_params)
      expire_all_pages
      redirect_to manifest_content_blocks_path
    else
      render 'edit'
    end
  end

  def destroy
    @content_block = ContentBlock.find(params[:id])
    @content_block.destroy

    expire_all_pages

    redirect_to manifest_content_blocks_path
  end

  private

  # Non-admins may only edit the content of a {ContentBlock}.
  def content_block_params
    if current_editor.admin?
      params[:content_block]
    else
      params[:content_block].slice(:content)
    end
  end
end
