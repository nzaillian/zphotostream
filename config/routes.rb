Rails.application.routes.draw do
  root to: 'photos#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }  

  resources :photos, only: [:index, :show]

  namespace :admin do
    resources :photos do
      post :positions, on: :collection
    end
  end
end
