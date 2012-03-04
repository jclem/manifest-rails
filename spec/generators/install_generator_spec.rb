require 'spec_helper'

describe "Manifest::InstallGenerator" do
  it "generates the pages migration" do
    Dir.glob("#{Rails.root}/db/migrate/*_create_pages.rb").count.should be(1)
  end

  it "generates the content blocks migration" do
    Dir.glob("#{Rails.root}/db/migrate/*_create_content_blocks.rb").count.should be(1)
  end

  it "generates the add index to pages migration" do
    Dir.glob("#{Rails.root}/db/migrate/*_add_index_to_pages.rb").count.should be(1)
  end

  it "generates the add index to content blocks migration" do
    Dir.glob("#{Rails.root}/db/migrate/*_add_index_to_content_blocks.rb").count.should be(1)
  end

  it "creates the pages directory" do
    File.exist?("#{Rails.root}/app/views/pages").should be(true)
  end

  it "creates the public layout" do
    File.exist?("#{Rails.root}/app/views/layouts/public.html.erb").should be(true)
  end
end
