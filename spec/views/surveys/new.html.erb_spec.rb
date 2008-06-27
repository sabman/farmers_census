require File.dirname(__FILE__) + '/../../spec_helper'

describe "/surveys/new.html.erb" do
  include SurveysHelper
  
  before(:each) do
    @survey = mock_model(Survey)
    @survey.stub!(:new_record?).and_return(true)
    @survey.stub!(:title).and_return("MyString")
    assigns[:survey] = @survey
  end

  it "should render new form" do
    render "/surveys/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", surveys_path) do
      with_tag("input#survey_title[name=?]", "survey[title]")
    end
  end
end


