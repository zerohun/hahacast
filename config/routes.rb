Hahacast::Application.routes.draw do

  get "requests/index"

  get "friends/index"

  resources :profiles
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  as :user do
    get "user/disconnect_with_facebook", :to => "users#disconnect_with_facebook", :as => :disconnect_with_facebook_user
    get "users/configuration/:id", :to => "users#show", :as => :user_configuration
    get "users/sign_out", :to => "devise/sessions#destroy", :as => :sign_out
  end

  resources :main
  resources :usercasts do
    resources :mentions
  end

  resources :mentions
  resources :friends, :only => [:index]


#  resources :mentions
  resources :friendships, :only => [:index, :create, :destroy]
  resources :news
  
  namespace :api do
    namespace :v1 do
      resources :tokens, :only => [:create, :destroy]
    end
  end


  resources :users, :only => :show
  resources :notifications
  resources :requests


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
#  root :to => 'main#index'
  root :to => "main#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
