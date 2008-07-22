class Answer < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question
  has_one :stage  
  has_and_belongs_to_many :options
end









                     