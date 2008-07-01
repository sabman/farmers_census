class Stage < ActiveRecord::Base
  has_many :questions
  
  def next
    id == Stage.count ? self : Stage.find(id+1)
  end

  def previous
    id == 1 ? self : Stage.find(id-1)
  end
  
end
