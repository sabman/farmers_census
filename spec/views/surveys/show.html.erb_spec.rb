require File.dirname(__FILE__) + '/../../spec_helper'

describe "/surveys/show.html.erb" do
  include SurveysHelper
  
  before(:each) do
    @survey = mock_model(Survey)
    @survey.stub!(:title).and_return("MyString")

    assigns[:survey] = @survey
  end

  it "should render attributes in <p>" do
    render "/surveys/show.html.erb"
    response.should have_text(/MyString/)
  end
end

