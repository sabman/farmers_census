require File.dirname(__FILE__) + '/../spec_helper'

describe Census do
  before(:each) do
    @census = Census.new
  end

  it "should be valid" do
    @census.should be_valid
  end
end
