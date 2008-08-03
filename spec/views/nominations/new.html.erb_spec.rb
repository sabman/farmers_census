require File.dirname(__FILE__) + '/../../spec_helper'

describe "/nominations/new.html.erb" do
  include NominationsHelper
  
  before(:each) do
    @nomination = mock_model(Nomination)
    @nomination.stub!(:new_record?).and_return(true)
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

  it "should render new form" do
    render "/nominations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", nominations_path) do
      with_tag("input#nomination_first_name[name=?]", "nomination[first_name]")
      with_tag("input#nomination_last_name[name=?]", "nomination[last_name]")
      with_tag("input#nomination_farm_name[name=?]", "nomination[farm_name]")
      with_tag("input#nomination_email[name=?]", "nomination[email]")
      with_tag("input#nomination_known_as[name=?]", "nomination[known_as]")
      with_tag("input#nomination_title[name=?]", "nomination[title]")
      with_tag("textarea#nomination_address[name=?]", "nomination[address]")
      with_tag("input#nomination_telephone_no[name=?]", "nomination[telephone_no]")
      with_tag("textarea#nomination_nominees_profile[name=?]", "nomination[nominees_profile]")
      with_tag("textarea#nomination_nominees_contributions[name=?]", "nomination[nominees_contributions]")
      with_tag("input#nomination_your_name[name=?]", "nomination[your_name]")
      with_tag("input#nomination_your_email[name=?]", "nomination[your_email]")
      with_tag("input#nomination_your_contact_details[name=?]", "nomination[your_contact_details]")
    end
  end
end


