class Answer < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question
  has_one :stage  
  has_and_belongs_to_many :options
  after_save "YamlHelper::write_to_yaml(self.class)"
    
  def answered?
    return true if text != nil or options.size > 0
    return false
  end
end









                     