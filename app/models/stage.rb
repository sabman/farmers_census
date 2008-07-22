class Stage < ActiveRecord::Base
  has_many :questions
  
  def next
    id == Stage.count ? self : Stage.find(id+1)
  end

  def previous
    id == 1 ? self : Stage.find(id-1)
  end
  
  def to_param
    "#{id}-#{title.gsub(/[^a-z1-9]+/i, '-')}"
  end
  
  def self.find_for_sitemap
    #TODO: Stage.find_for_sitemap
  end
end