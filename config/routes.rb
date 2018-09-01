Rails.application.routes.draw do
  resources :users, only: :create do
    collection do
      get 'me'
    end
  end
  resources :sessions, only: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
