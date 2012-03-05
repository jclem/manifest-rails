require 'spec_helper'

describe Manifest::SessionsController do
  before :each do
    @content_block = ContentBlock.create(title: 'Content Block', page_id: 1)
    @editor = Editor.create(email: 'user@example.com', password: 'password')
  end

  describe "#create" do
    it "logs in the user" do
      get :create, email: 'user@example.com', password: 'password'
      session[:editor_id].should eq(@editor.id)
    end
  end

  describe "#destroy" do
    it "logs out the user" do
      get :destroy
      session[:editor_id].should be(nil)
    end
  end
end
