require File.dirname(__FILE__) + '/../../spec_helper'

describe "/farmers/new.html.erb" do
  include FarmersHelper
  
  before(:each) do
    @farmer = mock_model(Farmer)
    @farmer.stub!(:new_record?).and_return(true)
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

  it "should render new form" do
    render "/farmers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", farmers_path) do
      with_tag("input#farmer_name[name=?]", "farmer[name]")
      with_tag("input#farmer_email[name=?]", "farmer[email]")
      with_tag("textarea#farmer_address[name=?]", "farmer[address]")
      with_tag("input#farmer_telephone[name=?]", "farmer[telephone]")
      with_tag("input#farmer_referring_party[name=?]", "farmer[referring_party]")
      with_tag("input#farmer_referee_contact[name=?]", "farmer[referee_contact]")
    end
  end
end


