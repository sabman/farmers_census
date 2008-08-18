require File.dirname(__FILE__) + '/../spec_helper'

describe Survey do
  fixtures :questions, :surveys, :answers
  before(:each) do
    @survey = Survey.create
    # answered question
    @q1 = Question.create(:text => "blah?")
    @a1 = Answer.create(:text => "ans", :question_id => @q1.id, :survey_id => @survey.id)
    # unanswered question
    @q2 = Question.create(:text => "blah?")
    @a2 = Answer.create(:text => nil, :question_id => @q2.id, :survey_id => @survey.id)

    #lat/lng
    # @q3 = Question.create(:text => "blah?")
    # @a2 = Answer.create(:text => nil, :question_id => @q2.id, :survey_id => @survey.id)
    
    @survey.questions << [@q1, @q2]
  end

  it "should be valid" do
    @survey.should be_valid
  end
  
  it "should return true if the survey has had a question answered" do
    @survey.question_answered?(@q1.id).should == true
  end
  
  it "should have answers for each questions" do
    @survey.questions.each  do |q| 
      @survey.answers.find_by_question_id(q.id).should_not equal(nil)
    end
  end
  
  it "should have same number of questions and answers" do
    @survey.answers.count.should == @survey.questions.count        
  end
  
  it "should have a lat/lng attributes from the answers" 
  
  describe "association with images and Avatars" do
    it "should have many avatars" 
  end

end
