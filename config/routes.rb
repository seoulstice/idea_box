Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: [:create, :new, :show] do
    resources :concerts, except: [:index]
  end

  namespace :admin do
    resources :genres, only: [:new, :create, :destroy, :index]
    resources :images, only: [:new, :create]
    get '/dashboard', to: 'admin#dashboard'
  end

  resources :images, only: [:index]

end
