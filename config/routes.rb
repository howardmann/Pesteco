Rails.application.routes.draw do
  root 'pages#about'

  get 'about' => 'pages#about', :as => 'about'
  get 'services' => 'pages#services', :as => 'services'
  get 'contact' => 'pages#contact', :as => 'contact'
  get 'certification' => 'pages#certification', :as => 'certification'
  get 'insurance' => 'pages#insurance', :as => 'insurance'
  get 'news' => 'pages#news', :as => 'news'

  get 'password_resets/new'

  get '/login' => 'session#new', :as => 'login'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy', :as => 'logout'

  resources :password_resets

  resources :clients do
    resources :buildings, only: [:new, :create]
    resources :users, only: [:new, :create]
    resources :groups, only: [:new, :create]
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :buildings, only: [:show, :edit, :update, :destroy] do
    resources :reports, only: [:new, :create]
  end

  resources :reports, only: [:show, :edit, :update, :destroy]

  resources :groups, only: [:edit, :update, :destroy]

  resources :posts

  get 'posts/:id/remove_attachments' => 'posts#remove_attachments', :as => 'post_remove_attachments'

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
