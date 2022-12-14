Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      resources :shows, only: %i[index show create update destroy]
      resources :clubs, only: %i[index show create update]
      resources :users, only: %i[show update] do
        resources :bookings, only: :index
        resources :club_followings, only: :index
        resources :comedian_followings, only: :index
        get 'created_shows', to: 'users#shows', as: :created_shows
        get 'infos', to: 'users#infos'
      end
      resources :bookings, only: %i[create destroy]
      resources :club_followings, only: %i[create destroy]
      resources :comedian_followings, only: %i[create destroy]
      resources :show_comedians, only: %i[create destroy]
      get 'comedians', to: 'users#comedians', as: :comedians
    end
  end
end
