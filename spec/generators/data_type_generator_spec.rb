require 'spec_helper'

describe "Manifest::DataTypeGenerator" do
  before :all do
    Dir.chdir("#{Rails.root}")
    run_generator
  end

  after :all do
    unrun_generator
  end

  it "creates the create_things migration" do
    Dir.glob('db/migrate/*_create_things.rb').count.should be(1)
  end

  it "creates the index view" do
    File.exist?('app/views/manifest/things/index.html.erb').should be(true)
  end

  it "ensures that the manifest namespace is in routes.rb" do
    File.open('config/routes.rb', 'r') do |f|
      f.lines.select { |l| l =~ /^\s*namespace :manifest/ }.count.should be(1)
    end
  end

  it "injects the new data type route into routes.rb" do
    File.open('config/routes.rb', 'r') do |f|
      f.lines.select { |l| l=~ /^\s*resources :things/ }.count.should be(1)
    end
  end

  it "creates the model file" do
    File.exist?('app/models/thing.rb').should be(true)
  end

  it "creates the controller file" do
    File.exist?('app/controllers/manifest/things_controller.rb').should be(true)
  end

  def run_generator
    `rails generate manifest:data_type Thing name:string`
  end

  def unrun_generator
    `rails destroy manifest:data_type Thing`
  end
end
