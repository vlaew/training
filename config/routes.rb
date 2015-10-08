Rails.application.routes.draw do

  devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' },
             only: [:sessions]

  namespace :registrations do
    resources :admins, only: [:create] do
      get 'sign_up' => 'admins#new', on: :collection
    end

    resources :sellers, only: [:create] do
      get 'sign_up' => 'sellers#new', on: :collection
    end

    resources :guests, only: [:create] do
      get 'sign_up' => 'guests#new', on: :collection
    end
  end

  resources :products do
    post 'buy', on: :member
  end

  root 'products#index'
end
