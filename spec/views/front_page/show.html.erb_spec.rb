require File.dirname(__FILE__) + '/../../spec_helper'

describe "/front_page/show" do
  before(:each) do
    render 'front_page/show'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', /Find me in app\/views\/front_page\/show/)
  end
end
