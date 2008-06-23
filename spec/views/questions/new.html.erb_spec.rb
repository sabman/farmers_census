require File.dirname(__FILE__) + '/../../spec_helper'

describe "/questions/new.html.erb" do
  include QuestionsHelper
  
  before(:each) do
    @question = mock_model(Question)
    @question.stub!(:new_record?).and_return(true)
    @question.stub!(:text).and_return("MyString")
    @question.stub!(:qtype).and_return("MyString")
    @question.stub!(:census_id).and_return("1")
    assigns[:question] = @question
  end

  it "should render new form" do
    render "/questions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", questions_path) do
      with_tag("input#question_text[name=?]", "question[text]")
      with_tag("input#question_qtype[name=?]", "question[qtype]")
    end
  end
end


