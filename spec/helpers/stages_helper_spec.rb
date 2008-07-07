require File.dirname(__FILE__) + '/../spec_helper'

describe StagesHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the StageHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(StagesHelper)
  end
  require File.dirname(__FILE__) + '/../spec_helper'

  describe "progress_bar_data" do
    before :each  do 
      @stage = mock_model(Stage)
      Stage.stub!(:size).and_return(7)
      @stage.stub!(:id).and_return(2)
    end
    it "should take the current stage object and return an array with string and numeric value" do
      progress_bar(@stage).should be_kind_of(Array)
    end
  end
  
  require File.dirname(__FILE__) + '/../spec_helper'

  describe "find_form_tag" do
    it "should take the record find the appropriate" do
      
    end
  end
end
