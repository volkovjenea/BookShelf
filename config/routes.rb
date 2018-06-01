#
# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :books
  resources :authors

  root 'welcome#index'
end
