require 'spec_helper'

describe ContentBlock, focus: true do
  before :each do
    @page = Factory(:page)
    @cb = Factory(:content_block, title: "Welcome Message", page: @page)
  end

  it "has a title" do
    @cb.should respond_to(:title)
  end

  it "has a slug" do
    @cb.should respond_to(:slug)
  end

  it "can belong to a page" do
    @cb.page.should eq(@page)
  end

  it "can be rendered" do
    @cb.should respond_to(:render)
  end

  it "slugifies the title after creation" do
    @cb.slug.should eq('welcome-message')
  end

  it "re-slugifies the title after updating" do
    @cb.update_attributes(title: 'New title')
    @cb.slug.should eq('new-title')
  end
end
