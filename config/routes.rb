Rails.application.routes.draw do
  root 'pages#home'
  get '/portfolio' => 'pages#portfolio', :as => 'user_portfolio'
  get '/transactions' => 'pages#transactions', :as => 'user_transactions'


  # get '/transactions' => 'transactions#index', :as => 'transactions'
  get '/stocks/:stock_id/transactions' => 'transactions#stock_transactions', :as => 'stock_transactions'
  post '/stocks/:stock_id/transactions' => 'transactions#create', :as => 'create_stock_transactions'
  get '/stocks/:stock_id/transactions/sell' => 'transactions#sell', :as => 'sell_stock_transactions'
  
  get '/stocks/:stock_id/transactions/buy' => 'transactions#buy', :as => 'buy_stock_transactions'
  get '/stocks' => 'stocks#index', :as => 'stocks'
  get '/stocks/:id' => 'stocks#show', :as => 'show_stock'
  # get '/users/:user_id' => "pages#dashboard", :as => :user_root
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
