# This sets up the constant to store the path to the location of static content
STATIC_ROOT  = File.join("db","static","#{ENV['RAILS_ENV']}")

if ENV['RAILS_ENV'] == nil 
  STATIC_ROOT  = File.join("db","static","development") 
end

Dir.mkdir(STATIC_ROOT) if not File.exists?(STATIC_ROOT)
