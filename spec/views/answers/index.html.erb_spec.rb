require File.dirname(__FILE__) + '/../../spec_helper'

describe "/answers/index.html.erb" do
  include AnswersHelper
  
  before(:each) do
    answer_98 = mock_model(Answer)
    answer_98.should_receive(:text).and_return("MyText")
    answer_98.should_receive(:question_id).and_return("1")
    answer_98.should_receive(:survey_id).and_return("1")
    answer_98.should_receive(:farm_id).and_return("1")
    answer_98.should_receive(:stage_id).and_return("1")
    answer_99 = mock_model(Answer)
    answer_99.should_receive(:text).and_return("MyText")
    answer_99.should_receive(:question_id).and_return("1")
    answer_99.should_receive(:survey_id).and_return("1")
    answer_99.should_receive(:farm_id).and_return("1")
    answer_99.should_receive(:stage_id).and_return("1")

    assigns[:answers] = [answer_98, answer_99]
  end

  it "should render list of answers" do
    render "/answers/index.html.erb"
    response.should have_tag("tr>td", "MyText", 2)
  end
end

