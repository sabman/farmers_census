require File.dirname(__FILE__) + '/../../spec_helper'

describe "/pages/show.html.erb" do
  include PagesHelper
  
  before(:each) do
    @page = mock_model(Page)
    @page.stub!(:name).and_return("MyString")
    @page.stub!(:permalink).and_return("MyString")
    @page.stub!(:content).and_return("MyText")

    assigns[:page] = @page
  end

  it "should render attributes in <p>" do
    render "/pages/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

