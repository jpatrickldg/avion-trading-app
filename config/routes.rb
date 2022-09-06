Rails.application.routes.draw do
  root 'pages#home'

  #################################PAGES ROUTES######################################
  get '/admin' => 'pages#admin_home', :as => 'admin_home'
  post '/admin/users' => 'pages#create_user', :as => 'admin_create_user'
  get '/admin/users/new_user' => 'pages#new_user', :as => 'admin_new_user'
  get 'admin/users/:id/edit' => 'pages#edit_user', as: 'admin_edit_user'
  get 'admin/users/:id' => 'pages#show', as: 'admin_show_user'
  patch 'admin/users/:id' => 'pages#update', as: 'admin_update_user'
  get '/portfolio' => 'pages#portfolio', :as => 'user_portfolio'
  get '/transactions' => 'pages#transactions', :as => 'user_transactions'
  #####################################################################################

  ##################################TRANSACTION ROUTES#################################
  # get '/transactions' => 'transactions#index', :as => 'transactions'
  get '/stocks/:stock_id/transactions' => 'transactions#stock_transactions', :as => 'stock_transactions'
  post '/stocks/:stock_id/transactions' => 'transactions#create', :as => 'create_stock_transactions'
  get '/stocks/:stock_id/transactions/sell' => 'transactions#sell', :as => 'sell_stock_transactions'
  get '/stocks/:stock_id/transactions/buy' => 'transactions#buy', :as => 'buy_stock_transactions'
  get '/stocks' => 'stocks#index', :as => 'stocks'
  get '/stocks/:id' => 'stocks#show', :as => 'show_stock'
  #########################################################################################

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
