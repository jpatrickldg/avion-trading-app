Rails.application.routes.draw do
  root 'pages#home'

  #################################PAGES ROUTES######################################
  get '/admin' => 'pages#admin_home', :as => 'admin_home'
  get '/admin/transactions' => 'pages#admin_transactions', :as => 'admin_transactions'
  post '/admin/users' => 'pages#create_user', :as => 'admin_create_user'
  get '/admin/users/new_user' => 'pages#new_user', :as => 'admin_new_user'
  get 'admin/users/:id/edit' => 'pages#edit_user', as: 'admin_edit_user'
  get 'admin/users/:id/activate' => 'pages#activate_user', as: 'admin_activate_user'
  get 'admin/users/:id/' => 'pages#admin_show_user', as: 'admin_show_user'
  patch 'admin/users/:id' => 'pages#update_user', as: 'admin_update_user'

  # patch 'admin/users/:id' => 'pages#update_activate_user', as: 'admin_update_activate_user'

  get '/portfolio' => 'pages#portfolio', :as => 'user_portfolio'
  get '/transactions' => 'pages#transactions', :as => 'user_transactions'
  ################################END PAGE ROUTES######################################

  ##################################TRANSACTION ROUTES#################################
  # get '/transactions' => 'transactions#index', :as => 'transactions'
  get '/stocks/:stock_id/transactions' => 'transactions#stock_transactions', :as => 'stock_transactions'
  post '/stocks/:stock_id/transactions' => 'transactions#create_stock_transaction', :as => 'create_stock_transactions'
  get '/stocks/:stock_id/transactions/buy' => 'transactions#buy', :as => 'buy_stock'
  get '/stocks/:stock_id/transactions/:id/sell' => 'transactions#sell', :as => 'sell_stock'
  patch '/stocks/:stock_id/transactions/:id' => 'transactions#update_transaction', :as => 'update_stock_transaction'
  ##################################END TRANSACTION ROUTES#############################
  get '/stocks' => 'stocks#index', :as => 'stocks'
  get '/stocks/:id' => 'stocks#show', :as => 'show_stock'
  #####################################################################################

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
