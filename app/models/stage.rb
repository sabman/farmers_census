class Stage < ActiveRecord::Base
  has_many :questions, :class_name => "question", :foreign_key => "stage_id"
  
  def next
    id == Stage.count ? self : Stage.find(id+1)
  end

  def previous
    id == 1 ? self : Stage.find(id-1)
  end
  
end
