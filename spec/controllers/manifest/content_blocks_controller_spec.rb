require 'spec_helper'

describe Manifest::ContentBlocksController do
  before :each do
    @page = Factory(:page)
    @cb = Factory(:content_block, page: @page)
  end

  describe "#index" do
    it "gets a list of all content blocks" do
      get :index
      assigns(:content_blocks).first.should be_an_instance_of ContentBlock
    end

    it "understands the manifest_content_blocks path" do
      manifest_content_blocks_path.should eq('/manifest/content_blocks')
    end
  end

  describe "#show" do
    it "shows the selected content block" do
      get :show, id: @cb.slug
      assigns(:content_block).should be_an_instance_of ContentBlock
    end
  end

  describe "#new" do
    it "prepares a new content block for creation" do
      get :new
      assigns(:content_block).should be_new_record
    end
  end

  describe "#create" do
    def create_content_block(valid=true)
      cb = valid ? Factory.attributes_for(:content_block, title: 'Hi There') : Factory.attributes_for(:content_block, title: '')
      post :create, content_block: cb
    end

    context "with a valid content block" do
      it "creates a new content block" do
        expect { create_content_block }.to change(ContentBlock, :count).by(1)
      end

      it "redirects to manifest_content_blocks path" do
        create_content_block
        response.should redirect_to manifest_content_blocks_path
      end
    end

    context "with an invalid content block" do
      it "renders the 'new' template" do
        create_content_block(false)
        response.should render_template('new')
      end
    end
  end

  describe "#edit" do
    def do_edit
      get :edit, id: @cb.slug
    end

    it "gets the specified content block for editing" do
      do_edit
      assigns(:content_block).should eq(@cb)
    end
  end

  describe "#update" do
    def do_update(valid = true)
      content_block = valid ? { title: 'New Title' } : { title: '' }
      post :update, id: @cb.slug, content_block: content_block
    end

    context "with a valid content block" do
      it "updates the content block" do
        do_update
        assigns(:content_block).title.should eq('New Title')
      end

      it "redirects to the content blocks path" do
        do_update
        response.should redirect_to(manifest_content_blocks_path)
      end
    end

    context "with an invalid content block" do
      it "renders the edit template" do
        do_update(false)
        response.should render_template('edit')
      end
    end
  end

  describe "#destroy" do
    it "destroys the specified content block" do
      expect { delete :destroy, id: @cb.slug }.to change(ContentBlock, :count).by(-1)
    end

    it "redirects to manifest_content_blocks path" do
      delete :destroy, id: @cb.slug
      response.should redirect_to manifest_content_blocks_path
    end
  end
end
