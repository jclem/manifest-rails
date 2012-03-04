require 'spec_helper'

describe PagesController, focus: true do
  before :each do
    @page = Factory(:page)
  end

  describe "#show" do
    context "with a valid slug" do
      it "renders the public layout" do
        get :show, id: @page.slug
        response.should render_template('layouts/public')
      end

      it "renders the given page" do
        get :show, id: @page.slug
        response.should render_template(@page.slug)
      end
    end

    context "with an invalid slug" do
      it "raises an exception" do
        expect {
          get :show, slug: 'i-do-not-exist'
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
