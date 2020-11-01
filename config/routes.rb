Rails.application.routes.draw do
  root 'games#new'
  resources :players, only: [:show]
  resources :hotels, only: [:update]
  resources :games do
    collection do
      get :dice
      get :exit
      get :score_card
    end
  end
end
