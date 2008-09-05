class Question < ActiveRecord::Base
  belongs_to :stage
  has_many :answers
  has_and_belongs_to_many :surveys
  has_and_belongs_to_many :options 
  after_save "YamlHelper::write_to_yaml(self.class)"
    
  def self.find_for_sitemap
    find(:all, :select => "id, updated_at",
                :order => "updated_at",
                :limit => 20 )
  end
  
  def options_attributes=(options_attributes)
    options_attributes.each_pair do |option_id, params_hash|
      options.find(option_id.to_i).update_attributes(params_hash)
    end       
  end     
  
end
