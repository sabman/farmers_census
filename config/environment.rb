# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.1' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_farmer-census_session',
    :secret      => 'c5a3e6787a3db36153fe761b16b620cdb7e560763e7c314f7a4babc08edb656a0bb75165f18534a951835eca39705d7a8e0fd37ec17a6ad1bfb7f60b1f5a07c7'
  }

  config.load_paths << "#{RAILS_ROOT}/app/sweepers"
  
  config.gem "RedCloth", :version => ">= 4.0.1", :lib => "redcloth",  :source => "http://code.whytheluckystiff.net/" 
  config.gem "chronic", :version => ">= 0.2.3" 
  config.gem "haml", :version => ">= 2.0.2"
  config.gem "GeoRuby", :lib => 'geo_ruby'
  config.gem "will_paginate"
  config.gem "image_science", :version => ">= 1.1.3" 
  
  config.action_controller.page_cache_directory = RAILS_ROOT + "/public/"
end

# These defaults are used in GeoKit::Mappable.distance_to and in acts_as_mappable
GeoKit::default_units = :miles
GeoKit::default_formula = :sphere

# This is the timeout value in seconds to be used for calls to the geocoder web
# services.  For no timeout at all, comment out the setting.  The timeout unit
# is in seconds. 
GeoKit::Geocoders::timeout = 3

# These settings are used if web service calls must be routed through a proxy.
# These setting can be nil if not needed, otherwise, addr and port must be 
# filled in at a minimum.  If the proxy requires authentication, the username
# and password can be provided as well.
GeoKit::Geocoders::proxy_addr = nil
GeoKit::Geocoders::proxy_port = nil
GeoKit::Geocoders::proxy_user = nil
GeoKit::Geocoders::proxy_pass = nil

# This is your yahoo application key for the Yahoo Geocoder.
# See http://developer.yahoo.com/faq/index.html#appid
# and http://developer.yahoo.com/maps/rest/V1/geocode.html
GeoKit::Geocoders::yahoo = 'bxlitrzV34GPA6P8pGKPQuddTdDR5DrqZAWDSa_DDXIu42gtyn1VnVh02dEobAYUd3k-'
    
# This is your Google Maps geocoder key. 
# See http://www.google.com/apis/maps/signup.html
# and http://www.google.com/apis/maps/documentation/#Geocoding_Examples
GeoKit::Geocoders::google = 'ABQIAAAAa7SFeUyLeV9ADXW6EhbOsBTJQa0g3IQ9GZqIMmInSLzwtGDKaBTox7Qzb4PL-EJhVrw0qM75IoR-hg'
    
# This is your username and password for geocoder.us.
# To use the free service, the value can be set to nil or false.  For 
# usage tied to an account, the value should be set to username:password.
# See http://geocoder.us
# and http://geocoder.us/user/signup
GeoKit::Geocoders::geocoder_us = false 

# This is your authorization key for geocoder.ca.
# To use the free service, the value can be set to nil or false.  For 
# usage tied to an account, set the value to the key obtained from
# Geocoder.ca.
# See http://geocoder.ca
# and http://geocoder.ca/?register=1
GeoKit::Geocoders::geocoder_ca = false

# This is the order in which the geocoders are called in a failover scenario
# If you only want to use a single geocoder, put a single symbol in the array.
# Valid symbols are :google, :yahoo, :us, and :ca.
# Be aware that there are Terms of Use restrictions on how you can use the 
# various geocoders.  Make sure you read up on relevant Terms of Use for each
# geocoder you are going to use.
GeoKit::Geocoders::provider_order = [:google,:yahoo]

# ActionMailer: This is the setting for smtp. Gmail now uses TLS so ./lib/smtp/tls.rb should be there
# We also need to have the ActionMailerTls plugin installed
ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => "587",
   :domain => "gmail.com",
   :authentication => :plain,
  #:user_name => "kiez.team@gmail.com",       :password => "stick343" 
   :user_name => "farmers.census@gmail.com",  :password => "farmers#43"
}

# For generating unique-ish keys for surveys.
# TODO: check if this should be in initializers
require 'digest/sha1'
