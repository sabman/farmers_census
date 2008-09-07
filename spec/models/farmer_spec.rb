require File.dirname(__FILE__) + '/../spec_helper'

describe Farmer do
  before(:each) do
    @farmer = Farmer.new
  end

  it "should be valid" do
    @farmer.should be_valid
  end
end
