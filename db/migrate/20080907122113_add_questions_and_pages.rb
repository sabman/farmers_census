class AddQuestionsAndPages < ActiveRecord::Migration
  def self.up
    exec('rake db:questions:load; rake db:pages:load')
  end

  def self.down
    Page.delete_all    
    Questions.delete_all
  end
end
