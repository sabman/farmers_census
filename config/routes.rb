ActionController::Routing::Routes.draw do |map|
  map.resources :answers

  map.map_test '/map_test', :controller => "stages", :action => "map_test"
  map.home '', :controller => "front_page", :action => "show" 
  
  map.resources :surveys, :has_many => :questions
  map.resources :questions, :has_one => :stage
  map.resources :stages, :has_many => :questions
  
  map.sitemap 'sitemap.xml', :controller => 'sitemap', :action => 'sitemap'
  
  #map.census '/census/:controller/:action/:id'

  #map.resources :users
  #map.resources :questions
  #map.resource :censusnsus, :has_many => :stages
    
  #map.resources :stages, :has_many => :questions
  #map.resource :survey, :has_many => :questions
  
  #map.resource :answer, :has_one => :question  # -> /census/1/answers
  #map.resource :survey, :has_many => :answers # -> /census/1/answers
  
  #map.resource :farm, :has_one => :census
  
  #map.resource :question, :has_many => :answers
    
  #map.resource :session
  
  # census has many stages
  # stage belongs to census
    # stage has many questions
    # question belongs to stage
  # map.resource :census do |c|
  #   c.resources :stages do |stage|
  #     stage.resources :questions
  #   end
  # end

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  #map.connect ':controller/:action' 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
