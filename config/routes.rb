Rails.application.routes.draw do



  resources :course_packets

  #things related to assignments
  resources :course_assignments do
    resources :assignment_responses
  end

  #things related to courses
  resources :course_periods
  get 'academic_terms' => 'course_periods#index'

  resources :course_sessions  do  
    resources :course_meetings
  end

  get 'my_sessions' => 'course_sessions#my_course_sessions', :as => :my_sessions

  resources :course_categories
  resources :courses

  #Things related to books
  resources :discussion_questions do
      resources :discussion_responses
  end 
  
  resources :books
  resources :articles

  resources :book_categories
  get 'categories_table' => 'book_categories#table_index', :as => :categories_table\

  resources :book_lists,       only: [:create, :destroy]
  resources :read_books,       only: [:create, :destroy]



  #Things related to users
  resources :users
  get 'register'  => 'users#new'
  get 'student_list' => 'users#student_list', :as => :student_list  
  get 'admin_list' => 'users#admin_list', :as => :admin_list
  get 'my_courses' => 'users#course_list', :as => :my_courses
  get 'my_instructors' => 'users#instructor_list', :as => :my_instructors


  resources :user_sessions
  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :account_activations, only: [:edit]

  resources :password_resets


  resources :users do
    member do
      get :following, :followers
      get :book_responses
      get :article_responses
      get 'books' => 'users#user_books', :as => :books
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
  get '/community' => 'high_voltage/pages#show', id: 'community'
  get '/policies' => 'high_voltage/pages#show', id: 'policies'
  get '/zoom' => 'high_voltage/pages#show', id: 'zoom'
  get '/zoom_tour' => 'high_voltage/pages#show', id: 'zoom_tour'
  get '/zoom_tips' => 'high_voltage/pages#show', id: 'zoom_tips'



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
