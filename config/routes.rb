Rails.application.routes.draw do
  resources :events do
    member do
      get :attendees
    end
  end

  resources :users do
    member do
      get :following, :followers, :search, :attendeds
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :communications, only: [:create, :destroy]
  resources :wants, only: [:create, :destroy, :index]
  resources :skills, only: [:create, :destroy, :index]
  resources :relationships, only: [:create, :destroy]
  resources :attendances, only: [:create, :destroy]
  resources :messages
  resources :conversations
  resources :posts, only: [:create, :destroy]
  resources :themes
  resources :categories

  root 'pages#home'

  match '/help',    to: 'pages#help',       via: 'get'
  match '/signup',  to: 'users#new',        via: 'get'
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  # link to become site admin - should only be used by confab developers, may eventually want to implement a secondary level that allows high level users to have access to add categories if necessary and access to other features as they come up.
  match '/admin_privilege_asdfghjkl1234567890', to: 'users#admin_privilege', via: 'get'
 
end
