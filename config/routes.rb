Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :favorites, only: [:create, :destroy, :show]
  root to: 'sessions#new'
  resources :pictures do
    collection do
      post :confirm
		end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
