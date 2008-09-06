class Option < ActiveRecord::Base
  has_and_belongs_to_many :answers
  has_and_belongs_to_many :questions
end
