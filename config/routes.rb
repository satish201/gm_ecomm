GmEcomm::Application.routes.draw do

  
  
 

  get "gmuser_sessions/new"

  
  
  #get :show, :id => @gmuser.id

 #get "mallmanager_admin/index"

  #get "mallmanager_admin/new_request"

 #get "retailers/index"

  #get "retailer_admin/index"
  
  #resources :mapviews

  #get "home/index"
  resources :api
  match '/api/create_user' => 'api#create_user'
  
resources :users, :user_sessions
 match 'logout' => 'user_sessions#destroy', :as => :logout  
  match 'login' => 'user_sessions#new', :as => :login
  
resources :retailers, :retaileradmin_sessions
  match 'signin' => 'retaileradmin_sessions#new', :as => :signin
  match 'signout' => 'retaileradmin_sessions#destroy', :as => :signout
  #retailer send request
  match '/new_request_form' => 'retailers#new_request_form'
  match '/notify_gm' => 'retailers#notify_gm'
  
resources :malladms, :malladmin_sessions
  match 'mallmanagersignin' => 'malladmin_sessions#new', :as => :mallmanagersignin
  match 'mallmanagersignout' => 'malladmin_sessions#destroy', :as => :mallmanagersignout
 #mallmanager send request
  match '/new_request_gm' => 'malladms#new_request_gm'
  match '/request_gm' => 'malladms#request_gm'
  
resources :gmusers, :gmuser_sessions
  match '/gmusersignin' => 'gmuser_sessions#new', :as => :gmusersignin
  match '/gmusersignout' => 'gmuser_sessions#destroy', :as => :gmusersignout
  match '/gmusersignup' => 'gmusers#new', :as => :gmusersignup  
  
resources :admin
resources :products
resources :malls
resources :lifestyles
resources :retailers        
resources :retaileradmins 
resources :malladms
resources :malladmins
      
      #match '/index' => 'retaileradmins#index'
      match '/productslist' => 'home#productslist'
      match '/lifestyleslist' => 'lifestyles#lifestyleslist'
      match '/products_index' => 'lifestyles#product_index'
      match '/check_product' => 'lifestyles#check_product'
      match '/search' => 'products#search', :as => :search
   
  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
