Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      resources :shows, only: %i[index show create update destroy]
      resources :clubs, only: %i[create]
      resources :users, only: %i[update] do
        resources :bookings, only: :index
        resources :club_followings, only: :index
        resources :comedian_followings, only: :index
      end
      resources :bookings, only: %i[create destroy]
      resources :club_followings, only: %i[create destroy]
      resources :comedian_followings, only: %i[create destroy]
      resources :show_comedians, only: %i[create destroy]
    end
  end
end
