class Nomination < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :farm_name, :telephone_no, :your_name, :email
  validates_uniqueness_of :email, :case_sensitive => false  
  validates_format_of   :email, :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i, 
                                    :message => "must be a valid email address"
end
