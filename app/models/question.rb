class Question < ActiveRecord::Base
  belongs_to :stage
  has_many :answers
  has_and_belongs_to_many :surveys
  has_and_belongs_to_many :options 
  
  def self.find_for_sitemap
    find(:all, :select => "id, updated_at",
                :order => "updated_at",
                :limit => 20 )
  end
end
