ActionController::Routing::Routes.draw do |map|
  map.admin '/admin', :controller => 'admin', :action => 'index' 
  map.resources :farmers
  map.resources :pages
  map.resources :nominations
  map.resources :answers 
  map.addavatar "avatar/create", :controller => 'avatar', :action => 'create'
  map.home '', :controller => "front_page", :action => "index"
  map.resources :surveys, :has_many => :questions, :collection => { :forgotten => :get }, :member => {:geocode_address => :get} 
  map.resources :questions, :has_one => :stage
  map.resources :stages, :has_many => :questions, :collection => { :done => :get }  
  map.sitemap 'sitemap.xml', :controller => 'sitemap', :action => 'sitemap'
    
  map.private_survey '/surveys/resume/:key', :controller => 'surveys', :action => 'resume', 
    :conditions => { :method => :get }
    
  map.resources :sessions 
  map.login '/login', :controller => 'sessions', :action => 'new' 
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'   
  map.static 'static/:permalink', :controller => "pages", :action => "show"

  # Install the default routes as the lowest priority.
  #map.connect ':controller/:action' 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
