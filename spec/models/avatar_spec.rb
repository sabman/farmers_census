require File.dirname(__FILE__) + '/../spec_helper'

describe Avatar do
  before(:each) do
    @avatar = Avatar.new
  end

  it "should be valid" do
    @avatar.should be_valid
  end
end
