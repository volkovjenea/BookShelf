#
# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
    resources :welcome
  root 'welcome#index'
  resources :books
  resources :authors


end
