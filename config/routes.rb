Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  namespace :admin do
  resources :ideas

  end

  resources :ideas, shallow: true do
    get :search, on: :collection
    get :flag, on: :member
    post :approve

    resources :likes, only: [:create, :destroy]
    resources :joins, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get '/' => 'ideas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
