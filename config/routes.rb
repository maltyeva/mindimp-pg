Rails.application.routes.draw do


  #things related to assignments
  resources :assignment_responses
  resources :course_assignments

  #things related to courses
  resources :course_periods
  get 'academic_terms' => 'course_periods#index'

  resources :course_sessions
  resources :course_categories
  resources :courses

  #Things related to books
  resources :discussion_questions
  resources :books
  resources :book_categories
  get 'categories_table' => 'book_categories#table_index', :as => :categories_table

  #Things related to users
  resources :users
  get 'register'  => 'users#new'
  get 'student_list' => 'users#student_list', :as => :student_list
  get 'my_courses' => 'users#course_list', :as => :my_courses

  resources :user_sessions
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :account_activations, only: [:edit]

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]


  resources :users do
    member do
      get :activate
    end
  end


  #static pages
  get '/about'    => 'high_voltage/pages#show', id: 'about'
  get '/contact'  => 'high_voltage/pages#show', id: 'contact'
  get '/privacy'  => 'high_voltage/pages#show', id: 'privacy'
  get '/terms'    => 'high_voltage/pages#show', id: 'terms'
  get '/team'    => 'high_voltage/pages#show', id: 'team'
  get '/student_portal'    => 'high_voltage/pages#show', id: 'student_portal'
  get '/admin_portal'    => 'high_voltage/pages#show', id: 'admin_portal'

  #home route
  get '/home', to: redirect('/')
  root :to => 'high_voltage/pages#show', id: 'home'

  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end



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
