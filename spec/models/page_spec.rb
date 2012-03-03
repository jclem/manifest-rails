require 'spec_helper'

describe Page do
  before :each do
    @page = Factory(:page)
  end

  it 'has a title' do
    @page.should respond_to(:title)
  end

  it 'has a slug' do
    Factory(:page, title: 'Contact Us').slug.should eq('contact-us')
  end
end
