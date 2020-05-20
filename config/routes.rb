Rails.application.routes.draw do
  
  resources :users
  
  get 'welcome/login', :as => :welcome_login
  
  root 'welcome#login'

  match 'auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  
  match 'auth/failure', :to => 'sessions#failure', :via => [:get, :post]
  
  get 'dashboard/index'
  
  get '/login', :to => 'sessions#new', :as => 'login'
  
  get '/destroy', :to => 'sessions#destroy', :as => 'logout'
  
  get '/cleanup', :to => 'sessions#cleanup', :as => 'cleanup'

  get 'property/new', :to => 'property#new' ,:as => 'createProperty', :via => [:post]
  
  match 'property/create', :to => 'property#create' , :via => [:post]
  
  match 'property/:id/edit', :to => 'property#edit', :as => 'editProperty', :via => [:get, :put, :post]
  
  match 'property/update/:id', :to => 'property#update', :as => 'updateProperty', :via => [:get,:put ,:post, :patch]

  get 'property/show.:id', :to => 'property#show', :as => 'propertyDetail'

  match 'property/destroyupdate/:id', :to => 'property#destroy', :as => 'deleteProperty', :via => [:post, :delete]
  
  get 'property/index', :to => 'property#index', :as => 'showProperty'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
 