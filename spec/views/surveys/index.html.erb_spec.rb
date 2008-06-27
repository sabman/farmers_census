require File.dirname(__FILE__) + '/../../spec_helper'

describe "/surveys/index.html.erb" do
  include SurveysHelper
  
  before(:each) do
    survey_98 = mock_model(Survey)
    survey_98.should_receive(:title).and_return("MyString")
    survey_99 = mock_model(Survey)
    survey_99.should_receive(:title).and_return("MyString")

    assigns[:surveys] = [survey_98, survey_99]
  end

  it "should render list of surveys" do
    render "/surveys/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

