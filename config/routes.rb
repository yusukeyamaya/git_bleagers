Rails.application.routes.draw do
  devise_for :users
  resources :bleagers, only: :show do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  root 'bleagers#index'

end