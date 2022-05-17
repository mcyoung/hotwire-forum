Rails.application.routes.draw do
  devise_for :users

  resources :discussions, only: %i[index]

  root to: "main#index"
end
