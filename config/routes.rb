require_relative '../config/environment.rb'
Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  get 'pages/info'
  get 'pages/terms'
  get 'pages/privacypolicy'
  #get 'pages/info'
  get 'search', to: 'search#index'
  resources :posts
  get '/playlists/new', to: "posts#playlist_new"
  post '/playlists', to: "posts#playlist"
  resources :playlists
# =======
#   root "posts#index"
#   devise_for :users
#   get 'pages/info'
#   get 'pages/terms'
#   get 'pages/privacypolicy'
#   get 'search', to: 'search#index'
#
#   resources :posts
  # get 'user/new'
  #
  # get 'user/name:string'
  #
  # get 'user/email:string'
  #
  # get 'user/image_url:string'
  #
  # get 'user/admin:boolean'
  #
  # get 'user/soundfriend:boolean'
  #
  # get 'user/instagram:string'
  #
  # get 'user/twitter:string'


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
