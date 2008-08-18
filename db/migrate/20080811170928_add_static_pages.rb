class AddStaticPages < ActiveRecord::Migration
  def self.up
    Page.create(:name => "About the campaign", :permalink => "about", :label => "/images/text/About_this_site.png", 
      :content => "We're *excited* to use this project to make visual the impact of a swelling new force on the American landscape. There are patriots working in this country today whose commitment to the freedom of the nation is exhibited in their fierce loyalty to its citizens, to their nutrition, their water, their open space, their health and their independence. Farmers have been here all along, but in this time especially of high energy costs, sinking dollar, and the changing climate--local food production has become a key puzzle piece, and with the current agricultural community reaching retirement age, recruitment has become a critical motive. 

      America has always respected its farmers ideologically, but the financial and social rewards have not always followed. The time has come for us to embrace farming and its practitioners--to recognize their service, to praise them, and to pay them a living wage. The time has come for the agricultural arts, so valued by our forefathers, to inspire the best, brightest and most dedicated young people to enter the field. Farming is hard work, it is good work, it is bold work. Farming means nurturing the interface of humanity and ecology, cherishing that delicate, complex and fragrant soil. Bringing forth food, life and a sustained well being for this country.

      We challenge the eaters, thinkers, mothers, markets and policy makers of this country-- to support the young farmers. We challenge the ecologists, humanists, activists, pacifists and survivalists to join in this movement. We vote with our fork, we vote with our vote, let us vote with our lives-- and restore agriculture, that delicious foundation of our human society. It is hard work, and we can only do it together." )
        
    Page.create(:name => "Sponsors", :permalink => "sponsors", :label => "/images/text/Sponsors.png", 
      :content => "!http://www.organicvalley.coop/fileadmin/templates/images/logos/ov_logo01.gif!")
       
    Page.create(:name => "Why?", :permalink => "why", :label => "/images/text/Why.png", 
    :content => 'This map is a way for us to feel our own numbers, and connect with nearby farmers as well as nearby markets/media.

      It helps to visualize the force, the surge, the irresistible fleet of citizen farmers- the merry coalition of constructive kismet.

      The website allows young farmers to fill out relevant details about their farming operation, their history farming, their future farming vision. Its a chance for us to raise our voices on behalf of  American agriculture.

      Journalists from national and local media will be able to access profiles of young farmers and get in contact with these rock star farmers

      The survey questions will generate useable demographic information about the obstacles for young farmers, the feasibility of various land-tenure options, and the potential rural economic development impact of a surge in new farmers.

      CONTACT: Severine von Tscharner Fleming, director
      415 299 1436 severine@pixiepoppins.org

      Cerise Mayo  New Amsterdam Market director
      cerise.mayo@gmail.com')
                  
  end

  def self.down
  end
end
