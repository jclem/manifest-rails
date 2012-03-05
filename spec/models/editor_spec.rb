require 'spec_helper'

describe Editor do
  before :each do
    @editor = Factory(:editor)
  end

  it "has an email" do
    @editor.should respond_to(:password)
  end
end
