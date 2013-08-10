Chrisalley::Application.routes.draw do
  
  get 'log-in', to: 'sessions#new', :as => :log_in  
  get 'log-out', to: "sessions#destroy", :as => :log_out
  get 'register', to: "users#new", :as => :register
  resources :projects, :path => 'development-portfolio'
  resources :qualifications, :path => 'it-qualifications'
  resources :jobs, :path => 'industry-experience'
  resources :sessions
  resources :password_resets, :path => 'password-resets'
  resources :users
  resources :pages
  get ':id', to: 'pages#show'
  root to: 'projects#index'
end
