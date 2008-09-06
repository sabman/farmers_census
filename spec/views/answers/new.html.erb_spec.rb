require File.dirname(__FILE__) + '/../../spec_helper'

describe "/answers/new.html.erb" do
  include AnswersHelper
  
  before(:each) do
    @answer = mock_model(Answer)
    @answer.stub!(:new_record?).and_return(true)
    @answer.stub!(:text).and_return("MyText")
    @answer.stub!(:question_id).and_return("1")
    @answer.stub!(:survey_id).and_return("1")
    @answer.stub!(:farm_id).and_return("1")
    @answer.stub!(:stage_id).and_return("1")
    assigns[:answer] = @answer
  end

  it "should render new form" do
    render "/answers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", answers_path) do
      with_tag("textarea#answer_text[name=?]", "answer[text]")
    end
  end
end


