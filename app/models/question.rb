class Question < ActiveRecord::Base
  belongs_to :stage, :class_name => "Stage", :foreign_key => "stage_id"
end
