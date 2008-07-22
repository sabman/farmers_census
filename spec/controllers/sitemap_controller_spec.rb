require File.dirname(__FILE__) + '/../spec_helper'

describe SitemapController do

  describe "GET 'sitemap'" do
    controller_name :sitemap
    
    before :each do
      @question = mock_model(Question)
      Question.stub!(:find).and_return([@question])
    end
    
    it "should be successful" do
      get 'sitemap'
      response.should be_success
    end
    
    it "should find all questions" do
      Question.should.should_receive(:find).with(:all).and_return [@question]
      get 'sitemap'
    end
  end
end
