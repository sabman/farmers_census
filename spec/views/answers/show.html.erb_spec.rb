require File.dirname(__FILE__) + '/../../spec_helper'

describe "/answers/show.html.erb" do
  include AnswersHelper
  
  before(:each) do
    @answer = mock_model(Answer)
    @answer.stub!(:text).and_return("MyText")
    @answer.stub!(:question_id).and_return("1")
    @answer.stub!(:survey_id).and_return("1")
    @answer.stub!(:farm_id).and_return("1")
    @answer.stub!(:user_id).and_return("1")
    @answer.stub!(:stage_id).and_return("1")

    assigns[:answer] = @answer
  end

  it "should render attributes in <p>" do
    render "/answers/show.html.erb"
    response.should have_text(/MyText/)
  end
end

