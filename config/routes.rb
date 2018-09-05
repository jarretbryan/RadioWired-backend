Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :genre, only: [:index]
      resources :users, only: [:index, :show, :destroy]
      resources :playlists do
        resources :subscriptions
      end
      
      post 'auth/register', to: 'users#register'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      post '/quizresults', to: 'listennotes#create'
      post '/play-episode', to: 'listennotes#episodes_create'
      delete '/delete-episode', to: 'listennotes#episodes_delete'
    end
  end
end
