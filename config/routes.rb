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

  root to: "main#index"
end
