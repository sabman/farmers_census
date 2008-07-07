require File.dirname(__FILE__) + '/../../spec_helper'

describe "/answers/edit.html.erb" do
  include AnswersHelper
  
  before do
    @answer = mock_model(Answer)
    @answer.stub!(:text).and_return("MyText")
    @answer.stub!(:question_id).and_return("1")
    @answer.stub!(:survey_id).and_return("1")
    @answer.stub!(:farm_id).and_return("1")
    @answer.stub!(:user_id).and_return("1")
    @answer.stub!(:stage_id).and_return("1")
    assigns[:answer] = @answer
  end

  it "should render edit form" do
    render "/answers/edit.html.erb"
    
    response.should have_tag("form[action=#{answer_path(@answer)}][method=post]") do
      with_tag('textarea#answer_text[name=?]', "answer[text]")
    end
  end
end


