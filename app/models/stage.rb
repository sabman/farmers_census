class Stage < ActiveRecord::Base
  has_many :questions

  def percent_completed(survey_id)
    total = questions.count
    a = questions.map{ |question| Survey.find(survey_id).question_answered?(question.id) ? 1 : 0 }
    answered = a.sum
    ((answered.to_f/total.to_f)*100).to_i
  end
  
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