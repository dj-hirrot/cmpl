Rails.application.routes.draw do
  namespace :api, { format: :json } do
    namespace :v1 do
      devise_for :users
    end
  end

  root 'home#index'

  match  '*path' => 'home#index', via: [:get]
end
