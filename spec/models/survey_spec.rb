require File.dirname(__FILE__) + '/../spec_helper'

describe Survey do
  before(:each) do
    @survey = Survey.new
  end

  it "should be valid" do
    @survey.should be_valid
  end
end
