class Survey < ActiveRecord::Base
  has_many :answers 
  has_and_belongs_to_many :questions
  has_one :avatar

  def find_answer_by_question(q_text)
    answers.find_by_question_id(
      questions.find_by_text(q_text).id
    )
  end
  
  def question_answered?(question_id)
    ans = answers.find_by_question_id(question_id) 
    return false if( (ans.text.nil? or ans.text =="") and ans.options.empty? )
    return true
  end
  
  def answer_attributes=(answer_attributes)  
    answer_attributes.each_pair do |answer_id, params_hash|
      answers.find(answer_id.to_i).update_attributes(params_hash)
    end   
  end
  
  def lat
    lat_q=questions.find_by_text("lat").id
    ans = answers.find_by_question_id(lat_q).text 
    return nil if ans.to_f == 0     
    return ans    
  end    
  
  def lng
    lng_q=questions.find_by_text("lng").id
    ans = answers.find_by_question_id(lng_q).text
    return nil if ans.to_f == 0     
    return ans 
  end
  
  def full_address
    street_address = find_answer_by_question("street address").text
    city = find_answer_by_question("city").text
    state = find_answer_by_question("state").text
    postal_code = find_answer_by_question("postal code").text
    country = find_answer_by_question("country").text    
    "#{street_address}, #{city}, #{state} #{postal_code}, #{country}"
  end
   
end