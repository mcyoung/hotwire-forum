# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories
  devise_for :users

  resources :discussions do
    with_options module: :discussions do
      resources :posts, only: %i[create show edit update destroy]
      resources :notifications, only: %i[create]
    end

    collection do
      get "category/:id", to: "categories/discussions#index", as: :category
    end
  end

  resources :notifications, only: %i[index] do
    collection do
      post "/mark_as_read", to: "notifications#read_all", to: "notifications#read_all", as: :read
    end
  end

  root to: "main#index"
end
