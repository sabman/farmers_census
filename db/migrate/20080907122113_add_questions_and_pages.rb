class AddQuestionsAndPages < ActiveRecord::Migration
  def self.up
    # exec('rake db:questions:load; rake db:pages:load')
    # should invokee this manually. On the server run the following:
    # cap invoke COMMAND="cd /data/rails/current; rake RAILS_ENV=express  db:questions:load"  HOSTS="nomad-berlin.dyndns.org"
    # cap invoke COMMAND="cd /data/rails/current; rake RAILS_ENV=express  db:pages:load" HOSTS="www.serveyourcountryfood.net"
  end

  def self.down
    Page.delete_all    
    Question.delete_all
  end
end
