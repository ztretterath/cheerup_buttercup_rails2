Rails.application.routes.draw do

  resources :reviews, only: [:update]

  resources :users, only: [:create, :show, :update, :index, :destroy] do
    collection do
      post '/login', to: 'users#login'
    end

    member do
      get '/cheerups', to: 'users#cheerups'
      post '/add_cheer_up', to: 'users#add_cheer_up'
      patch '/update_cheer_up/:cheer_up_id', to: 'users#update_cheer_up'
      delete 'remove_cheer_up/:cheer_up_id', to: 'users#remove_cheer_up'
    end
  end

  resources :cheer_ups, only: [:show, :index] do
    member do
      post '/add_review', to: 'cheer_ups#add_review'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
