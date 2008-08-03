require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nominations/show.html.erb" do
  include NominationsHelper
  
  before(:each) do
    @nomination = mock_model(Nomination)
    @nomination.stub!(:first_name).and_return("MyString")
    @nomination.stub!(:last_name).and_return("MyString")
    @nomination.stub!(:farm_name).and_return("MyString")
    @nomination.stub!(:email).and_return("MyString")
    @nomination.stub!(:known_as).and_return("MyString")
    @nomination.stub!(:title).and_return("MyString")
    @nomination.stub!(:address).and_return("MyText")
    @nomination.stub!(:telephone_no).and_return("MyString")
    @nomination.stub!(:date_of_birth).and_return(Date.today)
    @nomination.stub!(:nominees_profile).and_return("MyText")
    @nomination.stub!(:nominees_contributions).and_return("MyText")
    @nomination.stub!(:your_name).and_return("MyString")
    @nomination.stub!(:your_email).and_return("MyString")
    @nomination.stub!(:your_contact_details).and_return("MyString")

    assigns[:nomination] = @nomination
  end

  it "should render attributes in <p>" do
    render "/nominations/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

