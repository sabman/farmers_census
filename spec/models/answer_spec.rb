require File.dirname(__FILE__) + '/../spec_helper'

valid_params_hash = {
       :answer_1 => "Shoaib Burq",
       :answer_4 => ["Shoaib Burq", "abc"],
       :answer_2 => "19 Dec 1979", 
       :id => 11,
       :answer_33 => "Apple Orched" }

describe Answer do
  fixtures :surveys, :answers, :questions
  before(:each) do
    @answer = Answer.new
  end

  it "should be valid" do
    @answer.should be_valid
  end  
end
