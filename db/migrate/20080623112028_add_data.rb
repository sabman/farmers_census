class AddData < ActiveRecord::Migration
  def self.up
    census = Survey.create(:title => "Farmer Census")

    # text_field
    # text_area
    # yes_no
    # options
    # list
    
    # Stage 1: Contact Details
    stage = Stage.create(:title => "Contact Details")
    Question.create(:text => "First name", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Last name", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Name of farm", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Relation", :qtype => 'options', :stage_id => stage.id, :survey_id => census.id, :list => "married|single|partnership|other"  )
    Question.create(:text => "Status", :qtype => 'options', :stage_id => stage.id, :survey_id => census.id, :list => "renter|owner|intern|seasonal labor|student|staff"  )
    
    # Stage 2: Farm Details
    stage = Stage.create(:title => "Farm Details")
    Question.create(:text => "Years farming", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Years at the farm", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Acerage", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Primary crops/products", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Secondary processing on farm?", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Animals?", :qtype => 'yes_no', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Types & breeds of livestock", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Age of primary farmers", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Number of other young farmers", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Number of farm laborers", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Can you afford health insurance?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Can you afford to pay a living wage to employees?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Do you accept interns on your farm?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Organic status", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Are you saving your own seed?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Farmstand", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )

    # Stage 2: Affiliations and Memberships
    stage = Stage.create(:title => "Affiliations & Memberships")
    Question.create(:text => "Grange membership?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Local certifying body/regional sustainable aggricultural group", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Other farm groups", :qtype => "list", :stage_id => stage.id, :survey_id => census.id, :list =>"national farmers organization|national farmers union|farm bureau federation" )
    Question.create(:text => "Any organic growers groups", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Local farm/food groups", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    
    # Stage x: Getting in touch
    stage = Stage.create(:title => "Getting in touch")
    Question.create(:text => "telephone", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "email", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "website", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "address", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "state", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "postal code", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "county", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "country", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id ) 
  end

  def self.down
    Question.delete_all
    Stage.delete_all
    Survey.delete_all
  end
end
