class AddData < ActiveRecord::Migration
  def self.up
    # census = Survey.create(:title => "Farmer Census")
                
    # qtypes (Question Types): 
    # text_field
    # text_area
    # yes_no
    # options, :list => "blah|blah"
    # list, :list => "blah|blah"
    
    # Stage 1: Contact Details
    stage = Stage.create(:title_label => "/images/labels/contact_details.png", :title => "Contact Details")
    Question.create(:title_label => "/images/labels/name.png", :text => "First name", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/last_name.png", :text => "Last name", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/name_of_farm.png", :text => "Name of farm", :qtype => 'text_field', :stage_id => stage.id )
    
    q = Question.create(:title_label => nil, :label_list => nil, :text => "Born:", :qtype => 'options', :stage_id => stage.id, :list => "urban|rural|suburban|x-urban|other")
    create_options(q)
    
    Question.create(:title_label => "/images/labels/why_do_you_farm.png", :text => "Why do you farm?", :qtype => "text_area", :stage_id => stage.id )
        
    Question.create(:title_label => nil, :text => "Land tenure prospect", :qtype => "text_field", :stage_id => stage.id )   
    
    Question.create(:title_label => nil, :text => "Previous farming zip codes (comma separated e.g. 12345, 54321)", :qtype => "text_field", :stage_id => stage.id )   
    
    Question.create(:title_label => nil, :text => "Children on the farm?", :qtype => "text_field", :stage_id => stage.id )   

    q = Question.create(:title_label => nil, :label_list => "/images/labels/renter.png|/images/labels/owner.png||/images/labels/seasonal_labor.png|/images/labels/student.png|/images/labels/staff.png", :text => "Status at the Farm", :qtype => 'options', :stage_id => stage.id, :list => "renter|owner|intern|seasonal labor|student|staff")
    create_options(q)
        
    q = Question.create(:title_label => nil, 
      :label_list => "/images/labels/married.png|/images/labels/single.png|/images/labels/partnership.png|/images/labels/other.png|||",
      :text => "Partnership Status", :qtype => 'options', :stage_id => stage.id, 
      :list => "married|single|partnership|other|partner also farmer ?|partner/spouse not a farmer|n/a" )
    create_options(q)
      
    Question.create(:title_label => "/images/labels/educational_background.png", :text => "Educational background", :qtype => "text_field", :stage_id => stage.id )
    
    # Stage 2: Farm Details
    stage = Stage.create(:title_label => "/images/labels/farm_details.png", :title => "Farm Details")
    Question.create(:title_label => "/images/labels/years_farming.png", :text => "Years farming", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/years_at_the_farm.png", :text => "Years at the farm", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/acreage.png", :text => "Acreage", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/primary_crops_products.png", :text => "Primary crops/products", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/secondary_processing_on_farm.png", :text => "Secondary processing on farm?", :qtype => 'text_field', :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/animals.png", :label_list => "/images/labels/yes.png|/images/labels/no.png", :text => "Animals?", :qtype => 'yes_no', :list => "yes|no", :stage_id => stage.id )
    create_options(q)
    
    Question.create(:title_label => "/images/labels/if_so_number_types_breeds.png", :text => "Types & breeds of livestock", :qtype => "text_area", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/age_of_primary_farmers.png", :text => "Age of primary farmers", :qtype => "text_field", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/number_of_other_young_farmers.png", :text => "Number of other young farmers", :qtype => "text_field", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/number_of_farm_laborers.png", :text => "Number of farm laborers", :qtype => "text_field", :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/can_you_afford_health_insurance.png", :label_list => "/images/labels/yes.png|/images/labels/no.png", :text => "Can you afford health insurance?", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)
    
    Question.create(:title_label => "/images/labels/can_you_afford_to_pay_a_living_wage_to_employees.png", :text => "Can you afford to pay a living wage to employees?", :qtype => "text_area", :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/internships_on_your_farm.png", :label_list => "/images/labels/yes.png|/images/labels/no.png", :text => "Do you accept interns on your farm?", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)
    
    q = Question.create(:title_label => "/images/labels/organic_status.png", :label_list => "/images/labels/yes.png|/images/labels/no.png", :text => "Organic status", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)

    q = Question.create(:title_label => "/images/labels/saving_own_seed.png", :label_list => "/images/labels/yes.png|/images/labels/no.png", :text => "Are you saving your own seed?", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)

    q = Question.create(:title_label => "/images/labels/farmstand.png", :label_list => "/images/labels/yes.png|/images/labels/no.png", :text => "Farmstand", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)

    # Your Story
    stage = Stage.create(:title_label => "/images/labels/your_story.png", :title => "Your Story")
    Question.create(:title_label => "/images/labels/your_particular_challenges_getting_started.png", :text => "Your particular challenges getting started:", :qtype => "text_area", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/what_made_it_possible.png", :text => "What made it possible?", :qtype => "text_area", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/what_kind_of_political_institutional_support_would_you_like_to_see.png", :text => "What kind of institutional/ political support would you like to see?:", :qtype => "text_area", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/would_you_nominate_anyone_locally_to_facilitate_future_young_farmer_meetings.png", :text => "Would you nominate anyone local to facilitate future young farmer meetings?", :qtype => "text_area", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/who_are_your_literary_and_practical_heroes.png", :text => "Who are your literary and practical heros?", :qtype => "text_area", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/cultural.png", :text => "political heroes? cultural?", :qtype => "text_area", :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/best_way_to_reach_you.png", :label_list => "/images/labels/telephone.png|/images/labels/email.png|/images/labels/snailmail.png", :text => "Best way to reach you?", :qtype => "list", :stage_id => stage.id, :list => "telephone|email|snailmail")
    create_options(q)
    
    q = Question.create(:title_label => "/images/labels/would_you_like_to_join_the_mailing_list.png", :text => "Woud you like to join the mailing list y/n", :label_list => "/images/labels/yes.png|/images/labels/no.png", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id)
    create_options(q)
    
    Question.create(:title_label => "/images/labels/are_you_interested_in_being_profiled_on_the_site_so_that_the_press_can_find_you.png", :text => "Are you interested in being profiled on the site so that the press can find you?", :qtype => "text_area", :stage_id => stage.id)

    # Stage: Affiliations and Memberships
    stage = Stage.create(:title_label => "/images/labels/affiliations_and_memberships.png", :title => "Affiliations & Memberships")
    q = Question.create(:title_label => "/images/labels/grange_memberships.png", :text => "Grange membership?", :label_list => "/images/labels/yes.png|/images/labels/no.png", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)   
    Question.create(:title_label => "/images/labels/local_certifying_body.png", :text => "Local certifying body/regional sustainable aggricultural group", :qtype => "text_field", :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/other_farm_groups.png", :label_list => nil,  :text => "Other farm groups", :qtype => "list", :stage_id => stage.id, :list =>"national farmers organization|national farmers union|farm bureau federation" )
    create_options(q)
    
    Question.create(:title_label => nil, :text => "Any organic growers groups", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => nil, :text => "Local farm/food groups", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/coop_membership.png", :text => "Any coop memberships?", :qtype => 'text_field', :stage_id => stage.id ) #TODO when list is available change qtype to list
    Question.create(:title_label => "/images/labels/nearby_food_related_businesses_which_your_farm_collaborates_regularly.png", :text => "Nearby food-related businesses which your farm collaborates with regularly?", :qtype => 'text_field', :stage_id => stage.id )
    q = Question.create(:title_label => nil, :text => "Other memberships?", :label_list => "/images/labels/yes.png|/images/labels/no.png", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)
    
    Question.create(:title_label => "/images/labels/estimated_yearly_farm_income_gross.png", :text => "Estimated yearly farm income (gross)", :qtype => "text_field", :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/political_affiliation.png", :label_list => "/images/labels/democrats.png|/images/labels/republicans.png|/images/labels/greens.png|/images/labels/independent.png", :text => "Political affiliation?", :qtype => "list", :stage_id => stage.id, :list =>"democrats|republicans|greens|independent" )
    create_options(q)

    Question.create(:title_label => "/images/labels/ethnicity.png", :text => "Ethnicity?", :qtype => "text_field", :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/does_your_farm_work_with_low_income_people_on_food_security_issues.png", :text => "Does farm work with low-income people on food security issues?", :label_list => "/images/labels/yes.png|/images/labels/no.png", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id ) # updated
    create_options(q)

    # Farming Practices
    stage = Stage.create(:title_label => "/images/labels/farming_practices.png", :title => "Farming Practices")
    #Question.create(:title_label => "/images/labels/amount_of_inputs_grown_on_farm_grain_for_feeding_green_manure_etc.png", :text => "$ amount of inputs grown on farm (grain for feeding, green manure, etc)", :qtype => "text_field", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/amount_of_inputs_grown_on_farm.png", :text => "$ amount of inputs grown on farm (grain for feeding, green manure, etc)", :qtype => "text_field", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/amount_of_inputs_purchased_within_200_miles_of_farm.png", :text => "$ amount of inputs purchased WITHIN 200 miles of farm", :qtype => "text_field", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/amount_of_inputs_that_are_sourced_further_than_200_miles_from_farm.png", :text => "$ amount of inputs purchased that are sourced (mined, produced, etc) FURTHER THAN 200 miles of farm", :qtype => "text_area", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/weekly_diesel_gas_expenditure.png", :text => "$ weekly diesel/gas expenditure", :qtype => "text_field", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/alternative_or_cooperative_transport.png", :text => "Alternative/cooperative transport", :qtype => "text_area", :stage_id => stage.id )

    # Produce & Market
    stage = Stage.create(:title_label => "/images/labels/produce_and_market.png", :title => "Produce & Market")
    q = Question.create(:title_label => "/images/labels/produce_labeling.png", :text => "Produce labeling", :qtype => "list", :stage_id => stage.id, :list => "natural|food alliance|certified|local branding", :label_list => "/images/labels/natural.png|/images/labels/food_alliance.png|/images/labels/certified.png|/images/labels/local_branding.png" )
    create_options(q)
    
    Question.create(:title_label => nil, :text => "Any other labeling", :qtype => "text_area", :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/does_farm_sell_directly_to_customers.png", :text => "Does farm sell direct to customers?", :label_list => "/images/labels/yes.png|/images/labels/no.png", :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)

    Question.create(:title_label => nil, :text => "$ sales to direct customers?", :qtype => "text_field", :stage_id => stage.id )
    q = Question.create(:title_label => "/images/labels/does_farm_run_a_csa.png", :text => "Does farm run a CSA? (# of members)",:label_list => "/images/labels/yes.png|/images/labels/no.png",  :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id )
    create_options(q)
    
    Question.create(:title_label => nil, :text => "Total CSA members", :qtype => "text_field", :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/does_farm_sell_at_farmers_markets.png", :text => "Are there any farmers markets where you sell", :qtype => "text_area", :stage_id => stage.id ) # TODO: make it a map !!
    Question.create(:title_label => "/images/labels/does_farm_sell_to_food_brokers_distributors.png", :text => "Any food brokers/distributors that you sell to?", :qtype => "text_area", :stage_id => stage.id ) # TODO: make it a map !!
    q = Question.create(:title_label => "/images/labels/does_farm_sell_directly_to_restaurants.png", :text => "Any restaurants you directly to?", :label_list => "/images/labels/yes.png|/images/labels/no.png",  :qtype => "yes_no", :list => "yes|no",  :stage_id => stage.id ) # TODO: make it a map !!
    create_options(q)

    Question.create(:title_label => "/images/labels/does_farm_sell_directly_to_institutions.png", :text => "Any institutions you sell directly to?", :qtype => "text_area", :stage_id => stage.id ) # TODO: make it a map !!
    Question.create(:title_label => "/images/labels/does_farm_sell_through_the_internet.png", :text => "Any internet site you sell through?", :qtype => "text_field", :stage_id => stage.id ) 
    
    # Stage x: Getting in touch
    stage = Stage.create(:title_label => nil, :title => "Getting in touch")
    Question.create(:title_label => "/images/labels/telephone.png", :text => "telephone", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/email.png", :text => "email", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/website.png", :text => "website", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/address.png", :text => "street address", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => nil, :text => "city", :qtype => 'text_field', :stage_id => stage.id ) 
    Question.create(:title_label => "/images/labels/state.png", :text => "state", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/postal_code.png", :text => "postal code", :qtype => 'text_field', :stage_id => stage.id )
#    Question.create(:title_label => "/images/labels/county.png", :text => "county", :qtype => 'text_field', :stage_id => stage.id )
    Question.create(:title_label => "/images/labels/country.png", :text => "country", :qtype => 'text_field', :stage_id => stage.id ) 
    Question.create(:title_label => nil, :text => "lat", :qtype => 'text_field', :stage_id => stage.id ) 
    Question.create(:title_label => nil, :text => "lng", :qtype => 'text_field', :stage_id => stage.id ) 
    
    # qs = Question.find :all
    # census.questions = qs
  end

  def self.down
    Question.delete_all
    Stage.delete_all
    Survey.delete_all
    Option.delete_all
  end
  
  private

  def self.create_options(q)
    if not q.label_list.nil? 
      opts_files = q.list.split("|").zip(q.label_list.split("|"))
    else
      a = []
      1..q.list.split("|").size { a << nil }
      opts_files = q.list.split("|").zip(a)
    end
    opts_files.each do |of|
     o = Option.create(:text => of[0], :filename => of[1])
     q.options << o
    end
  end
  
end
