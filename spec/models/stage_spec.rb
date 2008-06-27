require File.dirname(__FILE__) + '/../spec_helper'

describe Stage do
  before(:each) do
    @stage = Stage.new
  end

  it "should be valid" do
    @stage.should be_valid
  end
  
  describe "instance method next and previous" do
    before :each do
      @stage_1 = Stage.create(:title => "Stage 1")
      @stage_2 = Stage.create(:title => "Stage 2")
      @stage_3 = Stage.create(:title => "Stage 3")
      @stage_first = Stage.find(:first)
      @stage_last =  Stage.find(:last)
    end
    it "should get the next stage by id when there is one" do
      @stage_next = @stage_1.next
      @stage_next.id.should == @stage_2.id
    end
    
    it "should get the same stage if called on the last stage" do
      @stage_last.next.id.should == @stage_3.next.id
    end
    
    it "should get the previous stage if there is one" do
      @stage_previous = @stage_3.previous
      @stage_previous.id.should == @stage_2.id
    end
    
    it "should get itself if its the last stage" do
      @stage_previous = @stage_first.previous
      @stage_previous.id.should == @stage_first.id
    end
  end
  
end
