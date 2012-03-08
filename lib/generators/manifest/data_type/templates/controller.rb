class Manifest::<%= ActiveSupport::Inflector.pluralize(name) %>Controller < Manifest::ManifestController
  layout :set_layout

  # Add more actions to me!

  def index
    @<%= plural_name.underscore %> = <%= name %>.all
  end

  def show
    @<%= name.underscore %> = <%= name %>.find(params[:id])
  end

  def new
    @<%= name.underscore %> = <%= name %>.new
  end

  def create
    @<%= name.underscore %> = <%= name %>.new(params[:<%= name.underscore %>])

    if @<%= name.underscore %>.save
      redirect_to manifest_<%= plural_name.underscore %>_path(@<%= name.underscore %>)
    else
      render 'new'
    end
  end

  def edit
    @<%= name.underscore %> = <%= name %>.find(params[:id])
  end

  def update
    @<%= name.underscore %> = <%= name %>.find(params[:id])

    if @<%= name.underscore %>.update_attributes(params[:page])
      redirect_to manifest_<%= plural_name.underscore %>_path
    else
      render 'edit'
    end
  end

  def destroy
    @<%= name.underscore %> = <%= name %>.find(params[:id])
    @<%= name.underscore %>.destroy

    redirect_to manifest_<%= plural_name.underscore %>_path
  end
end
