Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#controller'

  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy]
    resources :images, only: [:new, :create]
  end


end
