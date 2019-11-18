Rails.application.routes.draw do
  namespace :api, { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
      }
    end
  end

  root 'home#index'

  match  '*path' => 'home#index', via: [:get]
end
