require File.dirname(__FILE__) + '/../spec_helper'

describe Option do
  before(:each) do
    @option = Option.new
  end

  it "should be valid" do
    @option.should be_valid
  end
end
