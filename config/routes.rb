Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get "/searchlight_activerecord", controller: "ideas", action: "searchlight_activerecord"

  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy, :index]
    resources :images, only: [:new, :create]
    get '/dashboard', to: 'admin#dashboard'
  end

  resources :images, only: [:index]

end
