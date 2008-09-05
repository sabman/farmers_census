require File.dirname(__FILE__) + '/../../spec_helper'

describe "/farmers/edit.html.erb" do
  include FarmersHelper
  
  before do
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

  it "should render edit form" do
    render "/farmers/edit.html.erb"
    
    response.should have_tag("form[action=#{farmer_path(@farmer)}][method=post]") do
      with_tag('input#farmer_name[name=?]', "farmer[name]")
      with_tag('input#farmer_email[name=?]', "farmer[email]")
      with_tag('textarea#farmer_address[name=?]', "farmer[address]")
      with_tag('input#farmer_telephone[name=?]', "farmer[telephone]")
      with_tag('input#farmer_referring_party[name=?]', "farmer[referring_party]")
      with_tag('input#farmer_referee_contact[name=?]', "farmer[referee_contact]")
    end
  end
end


