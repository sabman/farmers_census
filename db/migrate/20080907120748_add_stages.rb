class AddStages < ActiveRecord::Migration
  def self.up
    # Order is important since it will determine the order of the survey stages. 
    # also the integer id will be used in questions to create the fk
    Stage.create(:title => "Contact Details",   :title_label => "/images/labels/contact_details.png")
    Stage.create(:title => "Farm Details",      :title_label => "/images/labels/farm_details.png")
    Stage.create(:title => "Your Story",        :title_label => "/images/labels/your_story.png")
    Stage.create(:title => "Affiliations & Memberships", :title_label => "/images/labels/affiliations_and_memberships.png")
    Stage.create(:title => "Farming Practices", :title_label => "/images/labels/farming_practices.png")
    Stage.create(:title => "Produce & Market",  :title_label => "/images/labels/produce_and_market.png")
    Stage.create(:title => "Getting in touch",  :title_label => nil)    
  end

  def self.down  
    Stage.delete_all
  end
end
