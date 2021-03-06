Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'

  get 'sessions/new'

  get 'users/new'


  root 'welcome#index'
  #root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  # get    '/about',   to: 'static_pages#about'
  # get    '/contact', to: 'static_pages#contact'

  get  '/signup',  to: 'users#new'
  get 'welcome/index'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :comments
    resources :tickets
  end

  resources :users

end