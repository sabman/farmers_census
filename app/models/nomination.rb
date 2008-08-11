require 'chronic'
class Nomination < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :farm_name, :telephone_no, :your_name, :email
  validates_uniqueness_of :email, :case_sensitive => false  
  validates_format_of   :email, :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i, 
                                    :message => "must be a valid email address"

  def full_name
    [first_name, last_name].join(" ")
  end
  
  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end
  
  def date_of_birth_str
    date_of_birth.to_s
  end
  
  def date_of_birth_str=(dob_str)
    self.date_of_birth = Chronic.parse(dob_str)
  rescue ArgumentError
    @date_of_birth_invalid = true
  end
  
  def validate
    errors.add(:date_of_birth, "is invalid; should be mm/dd/yyyy")
  end
end
