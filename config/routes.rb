Rails.application.routes.draw do
  get 'contact' => 'contacts#new'
  get 'contacts/create'
  get 'contacts/index'
  get 'about' => 'about#index'
  namespace :admin do
    get 'login' => 'sessions#new', :as =>'login'
    get 'sessions/create'
    get 'logout' => 'sessions#new', :as =>'logout'
  end
  namespace :admin do
    get 'users/new'
    get 'users/create'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
    get 'users' => 'users#index'
    get 'users/show'
    post 'users' => 'users#create'
  end
  namespace :admin do
    get 'comments/destroy'
  end
  get 'comments/new'
  namespace :admin do
    get 'categories/new'
    get 'categories/create'
    get 'categories/edit'
    get 'categories/update'
    get 'categories/destroy'
    get 'categories/index'
    get 'categories/show'
  end
  get 'categories/show'
  namespace :admin do
    get 'posts/new'
    get 'posts/create'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
    get 'posts/index'
    get 'posts/show'
  end
  get 'posts/index'
  get 'posts/show'
  root 'posts#index'
  resources :posts, :categories
  resources "contacts", only: [:new, :create]

  namespace :admin do
    resources :posts, :categories, :comments, :sessions
  end
  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
