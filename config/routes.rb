Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: 'admins/registrations' }
  devise_for :sellers, controllers: { registrations: 'sellers/registrations' }
  devise_for :guests, controllers: { registrations: 'guests/registrations' }

  devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout' },
             only: [:sessions]
  resources :products do
    post 'buy', on: :member
  end
  root 'home#index'
end
