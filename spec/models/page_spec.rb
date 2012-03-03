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

  it 'has a template path' do
    @page.template_path.should eq("#{Rails.root}/app/views/pages/#{@page.slug}.html.erb")
  end

  it 'creates a template after creation' do
    File.exist?(@page.template_path).should be(true)
  end

  it 'renames the template after updating' do
    @page.title = 'New Title'
    @page.save
    File.exist?(@page.template_path).should be(true)
  end

  it 'removes the template after updating' do
    @page.destroy
    File.exist?(@page.template_path).should be(false)
  end
end
