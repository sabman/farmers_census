require File.dirname(__FILE__) + '/../spec_helper'

describe Nomination do
  before(:each) do
    @nomination = Nomination.new
  end

  it "should be valid" do
    @nomination.should be_valid
  end
end
