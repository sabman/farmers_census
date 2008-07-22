require File.dirname(__FILE__) + '/../spec_helper'

describe Survey do
  fixtures :questions, :surveys, :answers
  before(:each) do
    @survey = Survey.create
    @q1 = Question.create(:text => "blah?")
    @a1 = Answer.create(:text => "ans", :question_id => @q1.id, :survey_id => @survey.id)
    @q2 = Question.create(:text => "blah?")
  end

  it "should be valid" do
    @survey.should be_valid
  end
  
  it "should return true if the survey has had a question answered" do
    @survey.question_answered?(@q1.id).should == true
    @survey.question_answered?(@q2.id).should == false
  end
end
