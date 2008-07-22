require File.dirname(__FILE__) + '/../spec_helper'

describe Question do
  before(:each) do
    @question_1 = Question.create(:text => 'whats ur name?')
    @question_2 = Question.create(:text => 'cest ce vu fe?')
  end

  it "should be valid" do
    @question_1.should be_valid
    @question_2.should be_valid
  end
  
  it "should find questions for creating a sitemap" do
    Question.find_for_sitemap.should == [@question_1, @question_2]
  end
end
