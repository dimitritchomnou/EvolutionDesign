Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'sessions/new'

  #ajout de la ressources users pour 
  #faire fonctionner Url de l'utilisateur
  #resources :users
  #sessions
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  #route pour les relations users
  resources :relationships, :only => [:create, :destroy]
 
 
  #resources pour user/relation
  resources :users do
    member do
      get :following, :followers
    end
  end


  get 'users/new'
  #route pour inscription
  get '/signup' => 'users#new'

  #create new sessions
  get '/signin' => 'sessions#new'

  post '/signin' => 'sessions#create'
  #delete sessions 
  get '/signout' => 'sessions#destroy', via: 'delete' #include méthod delete



  #Add routes home
  root 'pages#home'
  get 'pages/home' => 'pages#home'

  #Add routes contact
  get 'pages/contact' => 'pages#contact'

  #Add routes About
  get 'pages/about' => 'pages#about'

  #Add routes Help
  get 'pages/help' => 'pages#help'

  #Add routes user
  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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