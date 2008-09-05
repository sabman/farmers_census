require File.dirname(__FILE__) + '/../spec_helper'     

module PageSpecHelper
  def valid_attributes
    {
      :name => "new page",
      :content => "a bit of text to give the page some body",
      :permalink => "new_page",
      :label => "labels/new_page.png"
    }
  end
end

describe Page do
  include PageSpecHelper
  
  before(:each) do
    @page = Page.new
  end
  
  describe "saving of page" do
    it "should a create/overwrite the pages.yml file" do
      File.delete(File.join("#{STATIC_ROOT}", "pages.yml")) if File.exists?(File.join("#{STATIC_ROOT}", "pages.yml"))
      File.exists?(File.join("#{STATIC_ROOT}", "pages.yml")).should == false
      @page.update_attributes(valid_attributes)
      @page.save
      File.exists?(File.join("#{STATIC_ROOT}", "pages.yml")).should == true
    end
  end
  
end
