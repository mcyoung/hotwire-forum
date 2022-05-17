Rails.application.routes.draw do
  devise_for :users

  resources :discussions

  root to: "main#index"
end
