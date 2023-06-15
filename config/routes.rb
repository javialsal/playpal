Rails.application.routes.draw do
  get 'chatrooms/show'
  devise_for :users
  root to: "dashboards#home"

  resources :games do
    resources :participations, only: ['create']

    member do
      get :edit_score
      patch :update_score
    end
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :participations, only: ['index', 'edit', 'update'] do
    resources :reviews, only: ['create']
  end

  resources :users, only: ['show'] do
    resources :chatrooms, only: :index
  end

  get :mygames, to: "dashboards#mygames"
end
