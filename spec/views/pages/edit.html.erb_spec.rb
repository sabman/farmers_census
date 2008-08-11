require File.dirname(__FILE__) + '/../../spec_helper'

describe "/pages/edit.html.erb" do
  include PagesHelper
  
  before do
    @page = mock_model(Page)
    @page.stub!(:name).and_return("MyString")
    @page.stub!(:permalink).and_return("MyString")
    @page.stub!(:content).and_return("MyText")
    assigns[:page] = @page
  end

  it "should render edit form" do
    render "/pages/edit.html.erb"
    
    response.should have_tag("form[action=#{page_path(@page)}][method=post]") do
      with_tag('input#page_name[name=?]', "page[name]")
      with_tag('input#page_permalink[name=?]', "page[permalink]")
      with_tag('textarea#page_content[name=?]', "page[content]")
    end
  end
end


