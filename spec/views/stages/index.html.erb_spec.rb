require File.dirname(__FILE__) + '/../../spec_helper'

describe '/stages/index.html.erb' do
  describe "image uploads" do   
    before(:each) do 
      # create avatars
      av1 = mock_model(Avatar)
      av1.should_receive(:public_filename).with(:thumb).and_return('/images/image1.jpg')
      av2 = mock_model(Avatar)
      av2.should_receive(:public_filename).with(:thumb).and_return('/images/image2.jpg')

      # create survey
      @current_survey = mock_model(Survey)
      @current_survey.should_receive(:avatars).and_return(
        [av1, av2]
      )
    end
    it "should have a div to hold uploaded image thumbnails" do 
      render '/stages/index.html.erb'
      response.should have_tag("div#images")
    end
  end
end
