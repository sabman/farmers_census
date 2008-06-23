require File.dirname(__FILE__) + '/../spec_helper'

describe Stage do
  before(:each) do
    @stage = Stage.new
  end

  it "should be valid" do
    @stage.should be_valid
  end
end
