require File.dirname(__FILE__) + '/../../spec_helper'

describe "/questions/edit.html.erb" do
  include QuestionsHelper
  
  before do
    @question = mock_model(Question)
    @question.stub!(:text).and_return("MyString")
    @question.stub!(:qtype).and_return("MyString")
    @question.stub!(:census_id).and_return("1")
    assigns[:question] = @question
  end

  it "should render edit form" do
    render "/questions/edit.html.erb"
    
    response.should have_tag("form[action=#{question_path(@question)}][method=post]") do
      with_tag('input#question_text[name=?]', "question[text]")
      with_tag('input#question_qtype[name=?]', "question[qtype]")
    end
  end
end


