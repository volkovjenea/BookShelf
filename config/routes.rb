#
# frozen_string_literal: true

Rails.application.routes.draw do
  get 'chat/show'
  get 'welcome/index'
    resources :welcome
  root 'welcome#index'
  resources :books do
    resources :comments
  end
    resources :authors do
      resources :comments
  end
  resources :messages, only: [:show]
  mount ActionCable.server => '/cable'
end
