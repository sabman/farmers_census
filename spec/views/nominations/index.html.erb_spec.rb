require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nominations/index.html.erb" do
  include NominationsHelper
  
  before(:each) do
    nomination_98 = mock_model(Nomination)
    nomination_98.should_receive(:first_name).and_return("MyString")
    nomination_98.should_receive(:last_name).and_return("MyString")
    nomination_98.should_receive(:farm_name).and_return("MyString")
    nomination_98.should_receive(:email).and_return("MyString")
    nomination_98.should_receive(:known_as).and_return("MyString")
    nomination_98.should_receive(:title).and_return("MyString")
    nomination_98.should_receive(:address).and_return("MyText")
    nomination_98.should_receive(:telephone_no).and_return("MyString")
    nomination_98.should_receive(:date_of_birth).and_return(Date.today)
    nomination_98.should_receive(:nominees_profile).and_return("MyText")
    nomination_98.should_receive(:nominees_contributions).and_return("MyText")
    nomination_98.should_receive(:your_name).and_return("MyString")
    nomination_98.should_receive(:your_email).and_return("MyString")
    nomination_98.should_receive(:your_contact_details).and_return("MyString")
    nomination_99 = mock_model(Nomination)
    nomination_99.should_receive(:first_name).and_return("MyString")
    nomination_99.should_receive(:last_name).and_return("MyString")
    nomination_99.should_receive(:farm_name).and_return("MyString")
    nomination_99.should_receive(:email).and_return("MyString")
    nomination_99.should_receive(:known_as).and_return("MyString")
    nomination_99.should_receive(:title).and_return("MyString")
    nomination_99.should_receive(:address).and_return("MyText")
    nomination_99.should_receive(:telephone_no).and_return("MyString")
    nomination_99.should_receive(:date_of_birth).and_return(Date.today)
    nomination_99.should_receive(:nominees_profile).and_return("MyText")
    nomination_99.should_receive(:nominees_contributions).and_return("MyText")
    nomination_99.should_receive(:your_name).and_return("MyString")
    nomination_99.should_receive(:your_email).and_return("MyString")
    nomination_99.should_receive(:your_contact_details).and_return("MyString")

    assigns[:nominations] = [nomination_98, nomination_99]
  end

  it "should render list of nominations" do
    render "/nominations/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

