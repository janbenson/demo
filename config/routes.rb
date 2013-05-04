Demo::Application.routes.draw do
 	resource :demo
	resources :categories 
        resource :questions
	resource :answers
	resources :users 
	resources :profiles 
	resources :sessions,      :only => [:new, :create, :destroy]

    
      
    match '/contact', :to => 'pages#contact'
    match '/about',   :to => 'pages#about'
    match '/help',    :to => 'pages#help'
    match '/signup',  :to => 'users#new'
    match '/signin',  :to => 'sessions#new'
    match 'sessions/:id/shownewuser',  :to => 'sessions#shownewuser' , :as => :shownewuser
    match 'profiles/setuserprofile',  :to => 'profiles#setuserprofile' , :as => :setuserprofile
    
    match '/signout', :to => 'sessions#destroy'
    root :to => 'demos#index'
end
