Rails.application.routes.draw do
  get 'favorites/index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :favorites, only: [:create, :destroy, :show]
  resources :pictures do
    collection do
      post :confirm
		end
  end
end
