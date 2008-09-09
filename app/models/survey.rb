class Survey < ActiveRecord::Base
  has_many                    :answers 
  has_and_belongs_to_many     :questions
  has_many                    :avatars 
  has_one                     :farmer
  
  validates_email_veracity_of :email, :domain_check => false
  validates_uniqueness_of     :key, :email
  
  before_validation_on_create :assign_key

  def Survey.find_public
    Survey.find(:all, :conditions => ['public = ?', true])
  end
  
  def percentage_completed
    stages = Stage.find :all
    total = 0; count = 0
    stages.each{ |s| total = total + s.percent_completed(id); count = count+1  }
    total/count
  end

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

  # Update all answers for this survey - takes a has of answer _id and params hash
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
  
  def farm_name
    find_answer_by_question("Name of farm").nil? ? "" : find_answer_by_question("Name of farm").text 
  end

  def farmer_name
    find_answer_by_question("First name").nil? ? "" : find_answer_by_question("First name").text
  end
  
  def Survey.recent
    Survey.find(:all, :order => "created_at DESC", :limit => 10)
  end
  
  # TODO verify that this will not result in collisions of doom. Sorry Shoaib.
  def self.generate_key
    Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join)
  end
  
  protected
  
  def assign_key
    puts "WE ARE ION ASSIGN_KEY"
    self.key = self.class.generate_key
  end
  
end