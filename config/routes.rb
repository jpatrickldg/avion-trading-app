Rails.application.routes.draw do
  root 'pages#home'
  # get '/users/:user_id' => "pages#dashboard", :as => :user_root
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
