Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'

  ##################################ADMINS ROUTES##################################
  get '/admin' => 'admins#dashboard', :as => 'admin_dashboard'
  get '/admin/transactions' => 'admins#transactions', :as => 'admin_transactions'
  post '/admin/users' => 'admins#create_user', :as => 'admin_create_user'
  get '/admin/users/new_user' => 'admins#new_user', :as => 'admin_new_user'
  get 'admin/users/:id/edit' => 'admins#edit_user', as: 'admin_edit_user'
  get 'admin/users/:id/activate' => 'admins#activate_user', as: 'admin_activate_user'
  get 'admin/users/:id/' => 'admins#show_user', as: 'admin_show_user'
  patch 'admin/users/:id' => 'admins#update_user', as: 'admin_update_user'
  #################################END ADMIN ROUTES#################################

  ##################################TRADERS ROUTES##################################
  get '/trader' => 'traders#dashboard', :as => 'trader_dashboard'
  get '/portfolio' => 'traders#portfolio', :as => 'trader_portfolio'
  get '/transactions' => 'traders#transactions', :as => 'trader_transactions'
  ################################END TRADERS ROUTES################################

  ################################TRANSACTIONS ROUTES###############################
  # get '/transactions' => 'transactions#index', :as => 'transactions'
  get '/stocks/:stock_id/transactions' => 'transactions#stock_transactions', :as => 'stock_transactions'
  post '/stocks/:stock_id/transactions' => 'transactions#create_stock_transaction', :as => 'create_stock_transactions'
  get '/stocks/:stock_id/transactions/buy' => 'transactions#buy', :as => 'buy_stock'
  get '/stocks/:stock_id/transactions/:id/sell' => 'transactions#sell', :as => 'sell_stock'
  patch '/stocks/:stock_id/transactions/:id' => 'transactions#update_transaction', :as => 'update_stock_transaction'
  ##############################END TRANSACTIONS ROUTES##############################

end
