require File.dirname(__FILE__) + '/../spec_helper'

describe FrontPageController do

  #Delete these examples and add some real ones
  it "should use FrontPageController" do
    controller.should be_an_instance_of(FrontPageController)
  end


  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end
end
