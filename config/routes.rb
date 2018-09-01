Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :genre, only: [:index]
      resources :users, only: [:index, :show, :destroy] do
        resources :playlists do
          resources :subscriptions
        end
      end
      post 'auth/register', to: 'users#register'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
