require File.dirname(__FILE__) + '/../../spec_helper'

describe "/farmers/index.html.erb" do
  include FarmersHelper
  
  before(:each) do
    farmer_98 = mock_model(Farmer)
    farmer_98.should_receive(:name).and_return("MyString")
    farmer_98.should_receive(:email).and_return("MyString")
    farmer_98.should_receive(:address).and_return("MyText")
    farmer_98.should_receive(:telephone).and_return("MyString")
    farmer_98.should_receive(:referring_party).and_return("MyString")
    farmer_98.should_receive(:referee_contact).and_return("MyString")
    farmer_98.should_receive(:farm_id).and_return("1")
    farmer_98.should_receive(:survey_id).and_return("1")
    farmer_99 = mock_model(Farmer)
    farmer_99.should_receive(:name).and_return("MyString")
    farmer_99.should_receive(:email).and_return("MyString")
    farmer_99.should_receive(:address).and_return("MyText")
    farmer_99.should_receive(:telephone).and_return("MyString")
    farmer_99.should_receive(:referring_party).and_return("MyString")
    farmer_99.should_receive(:referee_contact).and_return("MyString")
    farmer_99.should_receive(:farm_id).and_return("1")
    farmer_99.should_receive(:survey_id).and_return("1")

    assigns[:farmers] = [farmer_98, farmer_99]
  end

  it "should render list of farmers" do
    render "/farmers/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

