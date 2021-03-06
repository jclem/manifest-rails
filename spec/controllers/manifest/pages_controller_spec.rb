require 'spec_helper'

describe Manifest::PagesController do
  before :each do
    @editor = Factory(:editor)
    session[:editor_id] = @editor.id
    @page = Factory(:page)
  end

  describe "#index" do
    it "gets a list of all pages" do
      get :index
      assigns(:pages).first.should be_an_instance_of Page
    end

    it "understands the manifest_pages path" do
      manifest_pages_path.should eq('/manifest/pages')
    end
  end

  describe "#show" do
    it "shows the selected page" do
      get :show, id: @page.slug
      assigns(:page).should be_an_instance_of Page
    end
  end

  describe "#new" do
    it "prepares a new page for creation" do
      get :new
      assigns(:page).should be_new_record
    end
  end

  describe "#create" do
    def create_page(valid=true)
      page = valid ? Factory.attributes_for(:page, title: 'Contact Us') : Factory.attributes_for(:page, title: '')
      post :create, page: page
    end

    context "with a valid page" do
      it "creates a new page" do
        expect { create_page }.to change(Page, :count).by(1)
      end

      it "redirects to page path" do
        create_page
        response.should redirect_to manifest_page_path(assigns(:page))
      end
    end

    context "with an invalid page" do
      it "renders the 'new' template" do
        create_page(false)
        response.should render_template('new')
      end
    end
  end

  describe "#edit" do
    it "gets the specified page for editing" do
      get :edit, id: @page.slug
      assigns(:page).should eq(@page)
    end
  end

  describe "#update" do
    def do_update(valid = true)
      page = valid ? { title: 'New Title' } : { title: '' }
      post :update, id: @page.slug, page: page 
    end

    context "with a valid page" do
      it "updates the page" do
        do_update
        assigns(:page).title.should eq('New Title')
      end

      it "redirects to the pages path" do
        do_update
        response.should redirect_to(manifest_pages_path)
      end
    end

    context "with an invalid page" do
      it "renders the edit template" do
        do_update(false)
        response.should render_template('edit')
      end
    end
  end

  describe "#destroy" do
    it "destroys the specified page" do
      expect { delete :destroy, id: @page.slug }.to change(Page, :count).by(-1)
    end

    it "redirects to manifest_pages path" do
      delete :destroy, id: @page.slug
      response.should redirect_to manifest_pages_path
    end
  end
end
