class Admin  
  # TODO: Change to read from a yaml config file
  NAME  = 'Severine'
  EMAIL = 'farmers.census@gmail.com'  if( ENV['RAILS_ENV'] == 'development' or  ENV['RAILS_ENV'] == 'test')   #password: farmers#43
  EMAIL = 'severine@pixiepoppins.org' if ENV['RAILS_ENV'] == 'express' 
  PASSWORD = 'abc123'  #password for this site           
end