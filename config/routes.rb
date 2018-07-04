Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'articles_public', to: 'pages#articles'

  resources :articles

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
