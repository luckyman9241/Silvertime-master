Silvertime::Application.routes.draw do
  
  resources :phases

  get "accounts/index"
  get "accounts/show"
  get "accounts/create"
  get "accounts/new"
  get "accounts/edit"
  get "accounts/update"
  get "accounts/destroy"
  get "jobs/index"
  get "jobs/show"
  get "jobs/create"
  get "jobs/new"
  get "jobs/edit"
  get "jobs/update"
  get "jobs/destroy"
  get "job/index"
  get "job/show"
  get "job/create"
  get "job/new"
  get "job/edit"
  get "job/update"
  get "job/destroy"
  resources :crews

  resources :users
  resources :sessions,  only: [:new, :create, :destroy]
  
  resources :timecards do
    collection do
      get 'review'
    end
    member do
      get 'approve'
    end
  end

  resources :jobs
  resources :accounts
  root  'static_pages#home'

  match '/signup', to: 'users#new', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
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
