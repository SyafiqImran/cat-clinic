Rails.application.routes.draw do
  # Sessions route
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete '/logout', to: 'sessions#delete'

  # http://localhost:3000/login = main page mungkin
  # http://localhost:3000/users = kena login baru boleh masuk
  # http://localhost:3000/welcome = main page show login and sign up
  # http://localhost:3000/authorized = if login => display ni kot
  # http://localhost:3000/users/new? = add new user
  # http://localhost:3000/users
  # http://localhost:3000/users

  # About page
  get 'about', to: 'about#index'

  # Contact page
  get 'contact', to: 'contact#index'

  # Appointment page

  get 'appointment', to: 'appointment#index'
  post 'appointment', to: 'appointment#create'






  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # get 'users/new'
  # get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
