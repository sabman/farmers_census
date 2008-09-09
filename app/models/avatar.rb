class Avatar < ActiveRecord::Base
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 3.megabytes, 
                 :processor => :image_science,
                 #:resize_to => '110x110>',
                 :thumbnails => {:thumb => "110x110>"}
  
  #validates_as_attachment 
  
  belongs_to :survey  
end
