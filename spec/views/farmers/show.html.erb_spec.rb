require File.dirname(__FILE__) + '/../../spec_helper'

describe "/farmers/show.html.erb" do
  include FarmersHelper
  
  before(:each) do
    @farmer = mock_model(Farmer)
    @farmer.stub!(:name).and_return("MyString")
    @farmer.stub!(:email).and_return("MyString")
    @farmer.stub!(:address).and_return("MyText")
    @farmer.stub!(:telephone).and_return("MyString")
    @farmer.stub!(:referring_party).and_return("MyString")
    @farmer.stub!(:referee_contact).and_return("MyString")
    @farmer.stub!(:farm_id).and_return("1")
    @farmer.stub!(:survey_id).and_return("1")

    assigns[:farmer] = @farmer
  end

  it "should render attributes in <p>" do
    render "/farmers/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

