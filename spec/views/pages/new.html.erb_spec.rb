require File.dirname(__FILE__) + '/../../spec_helper'

describe "/pages/new.html.erb" do
  include PagesHelper
  
  before(:each) do
    @page = mock_model(Page)
    @page.stub!(:new_record?).and_return(true)
    @page.stub!(:name).and_return("MyString")
    @page.stub!(:permalink).and_return("MyString")
    @page.stub!(:content).and_return("MyText")
    assigns[:page] = @page
  end

  it "should render new form" do
    render "/pages/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", pages_path) do
      with_tag("input#page_name[name=?]", "page[name]")
      with_tag("input#page_permalink[name=?]", "page[permalink]")
      with_tag("textarea#page_content[name=?]", "page[content]")
    end
  end
end


