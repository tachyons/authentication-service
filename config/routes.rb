Rails.application.routes.draw do
  resources :users, only: :create do
    collection do
      get 'me'
    end
  end
  resources :sessions, only: :create
  get 'public_key.pem', to: 'keys#public_key', as: :public_key
end
