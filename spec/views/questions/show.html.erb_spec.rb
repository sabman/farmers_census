require File.dirname(__FILE__) + '/../../spec_helper'

describe "/questions/show.html.erb" do
  include QuestionsHelper
  
  before(:each) do
    @question = mock_model(Question)
    @question.stub!(:text).and_return("MyString")
    @question.stub!(:qtype).and_return("MyString")
    @question.stub!(:census_id).and_return("1")

    assigns[:question] = @question
  end

  it "should render attributes in <p>" do
    render "/questions/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

