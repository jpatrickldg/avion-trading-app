Rails.application.routes.draw do
  get '/transactions' => 'transactions#index', :as => 'transactions'
  post '/transactions' => 'transactions#create', :as => 'create_transactions'
  
  get '/stocks/:id/buy' => 'transactions#buy', :as => 'buy_user_stocks'
  root 'pages#home'
  get '/stocks' => 'stocks#index', :as => 'stocks'
  get '/stocks/:id' => 'stocks#show', :as => 'show_stock'
  # get '/users/:user_id' => "pages#dashboard", :as => :user_root
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
