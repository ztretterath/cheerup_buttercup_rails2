Rails.application.routes.draw do

  # resources :users

  resources :users, only: [:create, :show, :destroy] do
    collection do
      post '/login', to: 'users#login'
    end
  end

  resources :cheer_ups, only: [:show, :index]

  resources :users, only: [:create, :show, :update, :index, :destroy] do
    member do
      get '/cheer_ups', to: 'users#cheer_ups'
      post '/add_cheer_up', to: 'users#add_cheer_up'
      patch '/update_cheer_up/:cheer_up_id', to: 'users#update_cheer_up'
      delete 'remove_cheer_up/:cheer_up_id', to: 'users#remove_cheer_up'
    end
  end

  resources :reviews, only: [:create, :show, :update, :index, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
