class Option < ActiveRecord::Base
  has_and_belongs_to_many :answers
  has_and_belongs_to_many :questions
  #after_save "YamlHelper::write_to_yaml(self.class)"  
end
