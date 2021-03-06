Rails.application.routes.draw do

  root to: 'events#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  resources :events do
    collection do
      get 'ranking'
    end
  end

  post   '/favorite/:event_id' => 'favorites#favorite',   as: 'favorite'
  delete '/favorite/:event_id' => 'favorites#unfavorite', as: 'unfavorite'

end
