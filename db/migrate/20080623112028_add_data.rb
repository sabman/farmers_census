class AddData < ActiveRecord::Migration
  def self.up
    census = Survey.create(:title => "Farmer Census")

    # text_field
    # text_area
    # yes_no
    # options, :list => "blah|blah"
    # list, :list => "blah|blah"
    
    # Stage 1: Contact Details
    stage = Stage.create(:title => "Contact Details")
    Question.create(:text => "First name", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Last name", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Name of farm", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Relation", :qtype => 'options', :stage_id => stage.id, :survey_id => census.id, :list => "married|single|partnership|other"  )
    Question.create(:text => "Status", :qtype => 'options', :stage_id => stage.id, :survey_id => census.id, :list => "renter|owner|intern|seasonal labor|student|staff"  )
    Question.create(:text => "Educational background", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )  
    
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

    # Your Story
    stage = Stage.create(:title => "Your Story")
    Question.create(:text => "Your particular challenges getting started:", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "What made it possible?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "What kind of institutional/ political support would you like to see?:", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Would you nominate anyone local to facilitate future young farmer meetings?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Why do you farm?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Who are your literary and practical heros?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "political heroes? cultural?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Best way to reach you?", :qtype => "list", :stage_id => stage.id, :survey_id => census.id, :list => "telephone|email|snailmail")
    Question.create(:text => "Woud you like to join the mailing list y/n", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id)
    Question.create(:text => "Are you interested in being profiled on the site so that the press can find you?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id)

    # Stage: Affiliations and Memberships
    stage = Stage.create(:title => "Affiliations & Memberships")
    Question.create(:text => "Grange membership?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Local certifying body/regional sustainable aggricultural group", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Other farm groups", :qtype => "list", :stage_id => stage.id, :survey_id => census.id, :list =>"national farmers organization|national farmers union|farm bureau federation" )
    Question.create(:text => "Any organic growers groups", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Local farm/food groups", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Any coop memberships?", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id ) #TODO when list is available change qtype to list
    Question.create(:text => "Nearby food-related businesses which your farm collaborates with regularly?", :qtype => 'text_field', :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Other memberships?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Estimated yearly farm income (gross)", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Political affiliation?", :qtype => "list", :stage_id => stage.id, :survey_id => census.id, :list =>"democrats|republicans|greens|independent" )
    Question.create(:text => "Ethnicity?", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Does farm work with low-income people on food security issues?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id ) 
    

    # Farming Practices
    stage = Stage.create(:title => "Farming Practices")
    Question.create(:text => "$ amount of inputs grown on farm (grain for feeding, green manure, etc)", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "$ amount of inputs purchased WITHIN 200 miles of farm", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "$ amount of inputs purchased that are sourced (mined, produced, etc) FURTHER THAN 200 miles of farm", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "$ weekly diesel/gas expenditure", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Alternative/cooperative transport", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )

    # Produce & Market
    stage = Stage.create(:title => "Produce & Market")
    Question.create(:text => "Produce labeling", :qtype => "list", :stage_id => stage.id, :survey_id => census.id, :list => "natural|food alliance|certified|local branding")
    Question.create(:text => "Any other labeling", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Does farm sell direct to customers?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "$ sales to direct customers?", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Does farm run a CSA? (# of members)", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Total CSA members", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id )
#    Question.create(:text => "Does farm sell at farmers markets y/n", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Are there any farmers markets where you sell", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id ) # TODO: make it a map !!
#    Question.create(:text => "Does farm sell to food brokers/distributors?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Any food brokers/distributors that you sell to?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id ) # TODO: make it a map !!
#    Question.create(:text => "Does farm sell directly to restaurants?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Any restaurants you directly to?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id ) # TODO: make it a map !!
#    Question.create(:text => "Does farm sell directly to institutions?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Any institutions you sell directly to?", :qtype => "text_area", :stage_id => stage.id, :survey_id => census.id ) # TODO: make it a map !!
#    Question.create(:text => "Does farm sell through the internet?", :qtype => "yes_no", :stage_id => stage.id, :survey_id => census.id )
    Question.create(:text => "Any internet site you sell through?", :qtype => "text_field", :stage_id => stage.id, :survey_id => census.id ) 
    
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
