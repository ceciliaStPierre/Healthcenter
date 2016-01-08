Healthcenter::Application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "home/welcome"
  get "plans/change_plan"
  get 'plans/index/:id' => 'plans#index', :as => :planslink
  get 'users/inbox' => 'users#inbox', :as => :inbox
  get 'plans/new/:id' => 'plans#new', :as => :newplan
  get 'users/new_conversation' => 'users#new_conversation', :as => :new_conversation
  get 'users/conversation'
  get 'users/password_change/:id' => 'users#password_change', :as => :password_change
  post 'users/update_password'
  post 'users/reply_message'
  post 'users/send_message'
  post 'plans/index'
  post 'family_groups/add_patient_to_group'
  post 'family_groups/remove_patient_from_group'

  resources :family_groups

  resources :users
  
  resources :patients

  resources :activities

  resources :plans

  resources :welcome

  resource :session, only: [:new, :create, :destroy]

  root 'home#welcome'

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
