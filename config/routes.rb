Rails.application.routes.draw do
  devise_for :users

  resources :discussions do
    resources :posts, only: %i[create show edit update destroy], module: :discussions
  end

  root to: "main#index"
end
