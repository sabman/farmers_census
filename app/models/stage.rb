class Stage < ActiveRecord::Base
  has_many :questions, :class_name => "question", :foreign_key => "stage_id"
end
