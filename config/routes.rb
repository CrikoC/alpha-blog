Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  # CRUD path for articles
  resources :articles
end
